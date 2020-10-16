class Bakery
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def ingredients
    ingredients = []
    desserts.each { |dessert| ingredients += dessert.ingredients }
    ingredients.uniq
  end

  def desserts
    Dessert.all.select { |dessert| dessert.bakery == self }
  end

  def average_calories
    calories = desserts.map { |dessert| dessert.calories }
    calories.inject { |sum, cal| sum + cal }.to_f / calories.count
  end

  def self.all
    @@all
  end
end
