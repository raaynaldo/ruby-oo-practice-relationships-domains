class Client
  attr_reader :name
  attr_accessor :trainer
  @@all = []

  def initialize(name, trainer = nil)
    @name = name
    @trainer = trainer
    @@all << self
  end

  def assign_trainer(trainer)
    self.trainer = trainer
  end

  def self.all
    @@all
  end
end
