# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Note.destroy_all

puts "Creating users..."

6.times do |i|
  letter = ('a'..'z').to_a[i]
  User.create!(
    name: Faker::Name.name,
    email: "#{letter}@notes.com",
    password: "111111"
  )
end

puts "Created #{User.count} users"

puts "Creating notes..."

User.all.each do |user|
  rand(2..8).times do |i|
    note = Note.new(
      title: Faker::Tea.variety,
      content: Faker::Lorem.paragraph(sentence_count: 20),
      user_id: user.id
    )
    note.save!
  end
end

puts "Created #{Note.count} notes."
puts "Done!"
