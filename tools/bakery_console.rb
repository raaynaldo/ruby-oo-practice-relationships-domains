require_relative "../config/environment.rb"
require "rainbow"

def reload
  load "config/environment.rb"
end

def check(correct)
  puts correct ? Rainbow("Passed!").green : Rainbow("Failed!").red
end

one_bakery = Bakery.new("one_bakery")
two_bakery = Bakery.new("two_bakery")
three_bakery = Bakery.new("three_bakery")

apple_pie = Dessert.new("Apple Pie", one_bakery)
ice_cream = Dessert.new("Ice Cream", one_bakery)
juice = Dessert.new("Juice", one_bakery)

eskrim = Dessert.new("Es Krim", two_bakery)
pie = Dessert.new("Pie", two_bakery)

ing_apple = Ingredient.new("Apple")
ing_green_apple = Ingredient.new("Green Apple")
ing_orange = Ingredient.new("Orange")
ing_mango = Ingredient.new("Manggo")

ing_pie = Ingredient.new("pie", 10)
ing_flour = Ingredient.new("flour", 10)

ing_ice = Ingredient.new("ice", 20)
ing_cream = Ingredient.new("cream", 20)

DessertIngredient.new(apple_pie, ing_apple)
DessertIngredient.new(apple_pie, ing_pie)
DessertIngredient.new(apple_pie, ing_flour)

DessertIngredient.new(ice_cream, ing_ice)
DessertIngredient.new(ice_cream, ing_cream)

DessertIngredient.new(juice, ing_apple)
DessertIngredient.new(juice, ing_mango)
DessertIngredient.new(juice, ing_orange)

DessertIngredient.new(eskrim, ing_ice)
DessertIngredient.new(eskrim, ing_cream)

DessertIngredient.new(pie, ing_pie)
DessertIngredient.new(pie, ing_flour)


puts "ingredients should return an array of ingredient objects for the bakery's desserts"
check(one_bakery.ingredients == [ing_apple, ing_pie, ing_flour, ing_ice, ing_cream, ing_mango, ing_orange])

puts "#desserts should return an array of dessert objects the bakery makes"
check(one_bakery.desserts == [apple_pie, ice_cream, juice])

puts "#average_calories should return a float totaling the average number of calories for the desserts sold at this bakery"
check(two_bakery.average_calories == 15)

puts "-----Desert-----"

puts "#ingredients should return an array of Ingredient objects for the dessert"
check(ice_cream.ingredients == [ing_ice, ing_cream])

puts "#bakery should return the Bakery object for the dessert"
check(ice_cream.bakery == one_bakery)

puts "#calories should return a float totaling all the calories for all the ingredients included in that dessert"
check(ice_cream.calories == 20)

puts ".all should return an array of all dessert objects"
check(Dessert.all == [apple_pie, ice_cream, juice, eskrim, pie])

puts "-----Ingredient-----"

puts "#dessert should return an array of all dessert objects that use this ingredient"
check(ing_apple.dessert == [apple_pie, juice])

puts "#bakeries should return the bakery objects for the bakeries that use that ingredient"
check(ing_apple.bakeries == [one_bakery])

puts ".all should return an array of all ingredients"
check(Ingredient.all.count == 8)

puts ".find_all_by_name(ingredient) should take a string argument and return an array of all ingredients that include that string in their name"
check(Ingredient.find_all_by_name("Apple") == [ing_apple, ing_green_apple])
