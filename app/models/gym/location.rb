class Location
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def clients
    clients = []
    LocationTrainer.all
      .select { |lt| lt.location == self }
      .each { |lt| clients += lt.trainer.clients }
    clients
  end

  def self.least_clients
    Location.all.min_by { |location| location.clients.count }
  end
end
