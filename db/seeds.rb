# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

places = [
  ["McDonalds", "burgers", "Boston", "description text"],
  ["The Coffee Room", "coffee shop", "Newtown", "A warm cozy nook in the heart of Newtown, PA... where you can GET STUFF DONNNNEE"]
]

places.each do |place_info|
  name, place_type, location, description = place_info
  Place.create!(name: name, place_type: place_type, location: location, description: description)
end

Place.create!(user_id: 1, name: "Forge",place_type: "Coffee Shop",neighborhood: "Union Square",description: "spacious bakery that serves Intelligensia coffee and ice cream",wifi: true,food: true,outdoor_seating: false,standing_options: true,address: "626 Somerville Ave",city: "Somerville",state: "MA",zip: "02143")
