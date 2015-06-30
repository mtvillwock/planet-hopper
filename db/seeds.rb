# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'
require 'json'
require 'awesome_print'

def build_countries_and_cities
  file = File.read('countries-hierarchy.json')
  countries = JSON.parse(file)
  countries = countries
  countries.each do |country|
    country["countryName"]
    cnty = Country.find_or_create_by(name: country["countryName"])

    if country["cities"].nil? || country["cities"].empty?
      next
    else
      country["cities"].each do |city|
        City.find_or_create_by(name: city["cityName"], country_id: cnty.id)
      end
    end
  end
end

def update_countries
  response = HTTParty.get "https://restcountries-v1.p.mashape.com/all",
  headers:{
    "X-Mashape-Key" => ENV["MASHAPE_KEY"],
    "Accept" => "application/json"
  }
  countries = JSON.parse(response.body)
  countries.each do |country|
    c = Country.find_or_create_by(name: country["name"])
    if c.nil?
      next
    else
      ap c.update(
        region: country["region"],
        subregion: country["subregion"]
      )
    end
  end
end

def build_airports
  # file = File.read('airports.json')
  # airport_data = JSON.parse(file)

  # airport_data.each do |airport|
  #   Airport.find_or_create_by(name: airport["name"], airport_code: airport["iata"])
  #   # Need way to get the city id before saving these
  # end
end

build_countries_and_cities
update_countries
build_airports
