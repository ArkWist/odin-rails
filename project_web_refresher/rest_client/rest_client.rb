require 'rest-client'

print 'Enter search term: '
term = gets.chomp.split.join('+')

results = RestClient.get('https://www.google.com/', params: {q: term})

puts "Response body:\n#{results}"