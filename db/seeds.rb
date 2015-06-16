# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

file = File.read('airports.json')
airport_data = JSON.parse(file)

airport_data.each do |airport|
  p Airport.new(name: airport["name"], airport_code: airport["iata"] )
  # Need way to get the city id before saving these
end