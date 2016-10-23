require 'rest-client'

put 'Enter search term: '
term = gets.chomp.split.join('+')

results = RestClient.get('https://www.google.com/', params: {q: term})

puts "Response body: #{results}"