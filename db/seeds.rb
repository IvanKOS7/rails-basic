# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


cat = Category.create([
  {title: 'English'},
  {title: 'Ruby'},
  {title: 'Rails'}
  ])
test = Test.create([
  {title: 'What is your level of English?', level: 2, category_id: cat[0].id, author: User.last.id },
  {title: 'Ruby basics', level: 3, category_id: cat[1].id, author: User.last.id },
  {title: 'Rails basics', level: 4, category_id: cat[2].id, author: User.last.id },
  {title: 'Ruby advanced', level: 7, category_id: cat[1].id, author: User.last.id },
  {title: Faker::Movie.title, level: 5, category_id: cat[1].id, author: User.last.id }

])
questions = Question.create([

{body: 'We _______ a lovely three weeks in the south of Spain last year.', test_id: test[0].id},
{body: 'Suzie and John are planning to get married and _______ a lot of children.', test_id: test[0].id},
{body: "Please don't forget to ring me when you _______ home", test_id: test[0].id},
{body: "Select RIGHT data-types in Ruby", test_id: test[1].id},
{body: "Hello.length - choose the correct amount that will be returned", test_id: test[1].id},
{body: Faker::Movie.quote, test_id: test[1].id}
])


answers = Answer.create([
  {body: 'spent',correct: true, question_id: questions[0].id},
  {body: 'passed',correct: false, question_id: questions[0].id},
  {body: 'took',correct: false, question_id: questions[0].id},
  {body: 'did',correct: false, question_id: questions[0].id},
  {body: 'have',correct: true, question_id: questions[1].id},
  {body: 'bring',correct: false, question_id: questions[1].id},

])
