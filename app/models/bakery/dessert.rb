class Dessert
  attr_reader :name, :bakery
  @@all = []

  def initialize(name, bakery = nil)
    @name = name
    @bakery = bakery
    @@all << self
  end

  def ingredients
    DessertIngredient.all.select { |di| di.dessert == self }.map { |di| di.ingredient }
  end

  def calories
    calories = ingredients.map{|ingredient| ingredient.calorie}
    calories.inject { |sum, cal| sum + cal }.to_f / calories.count
  end

  def self.all
    @@all
  end
end
