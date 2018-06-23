Airport.delete_all

# Seed Airports

codes = ['SFO', 'NYC', 'NRT', 'CDG', 'LHR']

codes.each do |airport|
  Airport.create!(code: airport)
end

# Seed Flights.

pairs = Airport.all.to_a.slice(0, 10).permutation(2).to_a
# .to_a[0..10].permutation ?

pairs.each do |airports|
  3.times { Flight.create!(origin:      airports[0],
                           destination: airports[1],
                           start_time:  Time.now.to_date + rand(3).days \
                                       + 6.hours + rand(12).hours,
                           duration:    2.hours + rand(8).hours) }
end

# Seed Bookings

Flight.all.each_with_index do |flight, f|
  flight.bookings.create!()
  reservations = flight.bookings.first
  rand(1..4).times do |i|
    reservations.passengers.create!(name:  "Name #{i}",
                                    email: "name#{i}_#{f}@example.com")
  end
end