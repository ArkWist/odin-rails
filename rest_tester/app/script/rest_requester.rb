# app/script/rest_requestor.rb
require 'rest_client'
url = "http://localhost:3000/users"
puts RestClient.get(url)
puts RestClient.get(url + "/new", {params: {id: 1}})
puts RestClient.get(url + "/edit", {params: {id: 1}})
puts RestClient.get(url + "/show", {params: {id: 1}})
# puts RestClient.post(url + "/create", "", {params: {id: 1}})
