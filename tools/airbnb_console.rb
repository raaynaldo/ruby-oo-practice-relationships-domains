require_relative '../config/environment.rb'
require 'rainbow'

def reload
  load 'config/environment.rb'
end

def check(correct)
   puts correct ? Rainbow("Passed!").green : Rainbow("Failed!").red
end

jakarta = Listing.new("Jakarta")
bandung = Listing.new("Bandung")
bogor = Listing.new("Bogor")

ray = Guest.new("ray")
fel = Guest.new("fel")
ben = Guest.new("ren")
win = Guest.new("win")

ray_jak = Trip.new(jakarta, ray)
ray_ban = Trip.new(bandung, ray)
ray_bog = Trip.new(bogor, ray)
Trip.new(bogor, ray)
Trip.new(bogor, ray)
Trip.new(bogor, ray)
Trip.new(bogor, ray)
Trip.new(bogor, ray)


fel_jak = Trip.new(jakarta, fel)
ben_jak = Trip.new(jakarta, ben)
win_jak = Trip.new(jakarta, win)
Trip.new(bogor, win)

puts "-----Listing-----"
puts "#guests returns an array of all guests who have stayed at a listing"
check(Rainbow(jakarta.guests == [ray, fel, ben, win]))

puts "#trips returns an array of all trips at a listing"
check(jakarta.trips == [ray_jak, fel_jak, ben_jak, win_jak])

puts "#trip_count returns the number of trips that have been taken to that listing"
check(jakarta.trip_count == 4)

puts ".all returns an array of all listings"
check(Listing.all == [jakarta, bandung, bogor])

puts ".find_all_by_city(city) takes an argument of a city name (as a string) and returns all the listings for that city"
check(Listing.find_all_by_city("Bogor") == bogor)

puts ".most_popular finds the listing that has had the most trips"
check(Listing.most_popular == bogor)

puts ""

puts "-----Guest-----"
puts "#listings returns an array of all listings a guest has stayed at"
check(ben.listings == [jakarta])

puts "#trips returns an array of all trips a guest has made"
check(ben.trips == [ben_jak])

puts "#trip_count returns the number of trips a guest has taken"
check(ben.trip_count == 1)

puts ".all returns an array of all guests"
check(Guest.all == [ray, fel, ben, win])

puts ".pro_traveller returns an array of all guests who have made over 1 trip"
check(Guest.pro_traveller == [ray, win])

puts ".find_all_by_name(name) takes an argument of a name (as a string), returns the all guests with that name"
check(Guest.find_all_by_name("fel") == fel)

puts "-----Trip-----"
puts "#listing returns the listing object for the trip"
check(ray_jak.listing)

puts "#guest returns the guest object for the trip"
check(ray_jak.guest)

puts ".all returns an array of all trips"
check(Trip.all.count == 12)
