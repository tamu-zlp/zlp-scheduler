# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


terms = [
    {name: 'Fall 2020 - College Station', active: 1},
    {name: 'Spring 2020 - College Station', active: 0}
    ]
    
terms.each do |term|
    Term.create!(term)
end