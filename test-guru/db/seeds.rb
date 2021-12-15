# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = Category.create([
  {title: 'English'}
  ])
test = Test.create([
  {title: 'What is your level of English?', level: 2, category_id: cat[0].id}
])
questions = Question.create([

{body: 'We _______ a lovely three weeks in the south of Spain last year.', test_id: test[0].id},
{body: 'Suzie and John are planning to get married and _______ a lot of children.', test_id: test[0].id},
{body: "Please don't forget to ring me when you _______ home", test_id: test[0].id}
])


answers = Answer.create([
  {answer: 'spent',correct: true, question_id: questions[0].id},
  {answer: 'passed',correct: false, question_id: questions[0].id},
  {answer: 'took',correct: false, question_id: questions[0].id},
  {answer: 'did',correct: false, question_id: questions[0].id},
  {answer: 'have',correct: true, question_id: questions[1].id},
  {answer: 'bring',correct: false, question_id: questions[1].id},
  {answer: 'get',correct: false, question_id: questions[1].id},
  {answer: 'make',correct: false, question_id: questions[1].id},
  {answer: 'will get',correct: true, question_id: questions[2].id},
  {answer: 'get',correct: false, question_id: questions[2].id},
  {answer: 'are going to get',correct: false, question_id: questions[2].id},
  {answer: 'are getting',correct: false, question_id: questions[2].id}
])
