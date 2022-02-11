# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create([
  {title: 'English'},
  {title: 'Ruby'},
  {title: 'Rails'}
  ])
test = Test.create([
  {title: 'What is your level of English?', level: 2, category_id: cat[0].id},
  {title: 'Ruby basics', level: 3, category_id: cat[1].id},
  {title: 'Rails basics', level: 4, category_id: cat[2].id},
  {title: 'Ruby advanced', level: 7, category_id: cat[1].id},
  {title: 'Ruby middle', level: 5, category_id: cat[1].id}

])
questions = Question.create([

{body: 'We _______ a lovely three weeks in the south of Spain last year.', test_id: test[0].id},
{body: 'Suzie and John are planning to get married and _______ a lot of children.', test_id: test[0].id},
{body: "Please don't forget to ring me when you _______ home", test_id: test[0].id},
{body: "Select RIGHT data-types in Ruby", test_id: test[1].id},
{body: "Hello.length - choose the correct amount that will be returned", test_id: test[1].id}
])


answers = Answer.create([
  {body: 'spent',correct: true, question_id: questions[0].id},
  {body: 'passed',correct: false, question_id: questions[0].id},
  {body: 'took',correct: false, question_id: questions[0].id},
  {body: 'did',correct: false, question_id: questions[0].id},
  {body: 'have',correct: true, question_id: questions[1].id},
  {body: 'bring',correct: false, question_id: questions[1].id},
  {body: 'get',correct: false, question_id: questions[1].id},
  {body: 'make',correct: false, question_id: questions[1].id},
  {body: 'will get',correct: true, question_id: questions[2].id},
  {body: 'get',correct: false, question_id: questions[2].id},
  {body: 'are going to get',correct: false, question_id: questions[2].id},
  {body: 'are getting',correct: false, question_id: questions[2].id},
  {body: '5',correct: true, question_id: questions[4].id},
  {body: '6',correct: false, question_id: questions[4].id},
])
user1 = User.create([{name: "First"}])
