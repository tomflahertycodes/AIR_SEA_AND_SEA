# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Seaplane.destroy_all
Booking.destroy_all
User.destroy_all

puts 'Creating users'

user1 = User.new(email: 'iownseaplanes@gmail.com', password:123456, user_name:'iownseaplanes')
user2 = User.new(email: 'iheartseaplanes@gmail.com', password:123456, user_name:'iheartseaplanes')
user3 = User.new(email: 'seaplanesforever@gmail.com', password:123456, user_name:'Frank')
user4 = User.new(email: 'seaplanesarethebest@gmail.com', password:123456, user_name:'Maria')
user5 = User.new(email: 'queenofseaplanes@gmail.com', password:123456, user_name:'Sven')

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!

@userid = user1.id
@userid2 = user2.id

puts 'Creating 20 seaplane'
20.times do
  seaplane = Seaplane.new(
    user_id: @userid,
    name:         Faker::FunnyName.name,
    description:  ["Enjoy a spectacular, unforgettable flight in an iconic,luxury seaplane with a first class window seat over one of
                  the most spectacular landscapes in the World !","Fly west towards the Kyles of Bute and Loch Fyne - over the Kintyre
                  peninsula towards The Sound of Jura.","Capture a unique and sublime taste of the
                  Highlands and the West Coast on this magnificent flight.","Exploring the spectacular West Coast of Scotland by
                  seaplane is a breath-taking and awe inspiring experience that will never leave you."].sample,
    location:     ['Avon','Bedfordshire','Berkshire','Buckinghamshire','Cambridgeshire','Cheshire','Cleveland','Cornwall','Cumbria','Derbyshire','Devon','Dorset','Durham','East Sussex','Essex','Gloucestershire','Hampshire','Herefordshire',
                  'Hertfordshire','Isle of Wight','Kent','Lancashire','Leicestershire','Lincolnshire','London','Merseyside','Middlesex','Norfolk','Northamptonshire','Northumberland','North Humberside','North Yorkshire','Nottinghamshire',
                  'Oxfordshire','Rutland','Shropshire','Somerset','South Humberside','South Yorkshire','Staffordshire','Suffolk','Surrey','Tyne and Wear','Warwickshire','West Midlands','West Sussex','West Yorkshire','Wiltshire','Worcestershire',
                  'Clwyd','Dyfed','Gwent','Gwynedd','Mid Glamorgan','Powys','South Glamorgan','West Glamorgan'].sample,
    price:        rand(90..500),
    category:     ['Floatplane', 'Flying boat', 'Amphibious aircraft'].sample,
    capacity:     rand(1..3)
  )
  seaplane.save!

  image_url = "https://source.unsplash.com/random?sig=#{rand(1..10)}/&seaplane/800x600"
  file = URI.open(image_url)
  seaplane.photo.attach(io: file, filename: "#{seaplane.name.gsub(" ", "-")}.jpeg", content_type: 'image/jpeg')
end

puts 'Generating bookings...'

booking1 = Booking.new(start_date: 'Thu, 25 Nov 2021', end_date: 'Fri, 26 Nov 2021', approved: true, user_id: @userid2, seaplane_id: Seaplane.last.id)
booking1.save!

puts 'Finished!'
