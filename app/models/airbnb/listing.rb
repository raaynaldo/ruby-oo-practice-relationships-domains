class Listing
  attr_reader :city
  @@all = []

  def initialize(city)
    @city = city
    @@all << self
  end

  def guests
    trips.map { |trip| trip.guest }
  end

  def trips
    Trip.all.select { |trip| trip.listing == self }
  end

  def trip_count
    trips.count
  end

  def self.all
    @@all
  end

  def self.find_all_by_city(city)
    Listing.all.find { |listing| listing.city == city }
  end

  def self.most_popular
    trips = Trip.all.map{|trip| trip.listing }
    Listing.all.max_by { |listing| trips.count(listing) }
  end
end
