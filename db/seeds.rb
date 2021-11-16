# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Seaplane.destroy_all

puts 'Creating 20 seaplane'
20.times do
  seaplane = Seaplane.new(
    user_id: 1,
    name:         Faker::FunnyName.name,
    description:  "Enjoy a spectacular, unforgettable flight in an iconic,
                  luxury seaplane with a first class window seat over one of
                  the most spectacular landscapes in the World !",
    location:     Faker::Address.city,
    price:        rand(100..500),
    category:     ['Floatplanes', 'Flying boats', 'Amphibious aircraft'].sample,
    availability: ['Fly now!', 'Require specific license'].sample,
    capacity:     rand(1..3)
  )
  seaplane.save!

  image_url = "https://source.unsplash.com/random?sig=#{rand(1..10)}/&seaplane/800x600"
  file = URI.open(image_url)
  seaplane.photo.attach(io: file, filename: "#{seaplane.name.gsub(" ", "-")}.jpeg", content_type: 'image/jpeg')
end
puts 'Finished!'
