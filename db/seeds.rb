# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Note.destroy_all

puts "Creating notes..."

16.times do
  note = Note.new(
    title: Faker::Tea.variety,
    content: Faker::Lorem.paragraph(sentence_count: 20)
  )
  note.save!
  puts "Note #{note.title} created"
end

puts "Created #{Note.count} notes."
puts "Done!"
