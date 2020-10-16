class Ingredient
  attr_reader :name, :calorie
  @@all = []

  def initialize(name, calorie = 10)
    @name = name
    @calorie = calorie
    @@all << self
  end

  def dessert
    DessertIngredient.all.select { |di| di.ingredient == self }.map { |di| di.dessert }
  end

  def bakeries
    dessert.map { |dessert| dessert.bakery }.uniq
  end

  def self.all
    @@all
  end

  def self.find_all_by_name(name)
    self.all.select { |ing| ing.name.include?(name) }
  end
end
