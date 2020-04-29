# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Term.ImportTermList!
# Find the term you want all the courses for, this just takes the first term in the DB
t = Term.all[0]
t.import_all_courses!
t.update_attributes(:active => true)