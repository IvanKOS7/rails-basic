# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Test.create(title: 'Ruby test', level: 3)
Test.create(title: 'Rails test', level: 7)
Test.create(title: 'SQL test', level: 4)

Answer.create(correct: 'I do not understand')
