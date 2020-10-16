class DessertIngredient
  attr_reader :dessert, :ingredient
  @@all = []

  def initialize(dessert, ingredient)
    @dessert = dessert
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
