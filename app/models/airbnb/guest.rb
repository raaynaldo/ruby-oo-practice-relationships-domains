class Guest
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def listings
    trips.map { |trip| trip.listing }
  end

  def trips
    Trip.all.select { |trip| trip.guest == self }
  end

  def trip_count
    trips.count
  end

  def self.all
    @@all
  end

  def self.pro_traveller
    guests = Trip.all.map{|trip| trip.guest}
    Guest.all.select { |guest| guests.count(guest) > 1 }
  end

  def self.find_all_by_name(name)
    Guest.all.find{|guest| guest.name == name}
  end
end
