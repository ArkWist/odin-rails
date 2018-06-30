Airport.delete_all
Flight.delete_all

# Seed Airports

codes = ['SFO', 'NYC', 'NRT', 'CDG', 'LHR']
codes.each do |code|
  Airport.create(iata: code)
end

# Seed Flights

pairs = Airport.all.to_a.slice(0, 10).permutation(2).to_a
pairs.each do |pair|
  6.times do
    depart = Time.now.to_date + rand(3).days + 6.hours + rand(12).hours
    Flight.create(origin:      pair[0],
                  destination: pair[1],
                  departure:   depart,
                  arrival:     depart + 2.hours + rand(8).hours)
  end
end