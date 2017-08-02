sfo = Airport.new(code: 'SFO')
nyc = Airport.new(code: 'NYC')
sfo.save
nyc.save

Flight.create!(origin:      sfo,
               destination: nyc,
               start_time:  DateTime.new(2017,8,15,9,0,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      sfo,
               destination: nyc,
               start_time:  DateTime.new(2017,8,15,12,0,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      nyc,
               destination: sfo,
               start_time:  DateTime.new(2017,8,15,10,30,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      nyc,
               destination: sfo,
               start_time:  DateTime.new(2017,8,15,13,30,0),
               duration:    6.hours.to_i)
               
Flight.create!(origin:      sfo,
               destination: nyc,
               start_time:  DateTime.new(2017,8,16,9,0,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      sfo,
               destination: nyc,
               start_time:  DateTime.new(2017,8,16,12,0,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      nyc,
               destination: sfo,
               start_time:  DateTime.new(2017,8,16,10,30,0),
               duration:    6.hours.to_i)
Flight.create!(origin:      nyc,
               destination: sfo,
               start_time:  DateTime.new(2017,8,16,13,30,0),
               duration:    6.hours.to_i)