# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: 'English')
Test.create(title: 'What is your level of English?', level: 2, categories_id: 1)
Question.create(body: 'We _______ a lovely three weeks in the south of Spain last year.', tests_id: 1)
Answer.create(answer: 'spent',correct: true, questions_id: 1)
Answer.create(answer: 'passed',correct: false, questions_id: 1)
Answer.create(answer: 'took',correct: false, questions_id: 1)
Answer.create(answer: 'did',correct: false, questions_id: 1)
Question.create(body: 'Suzie and John are planning to get married and _______ a lot of children.', tests_id: 1)
Answer.create(answer: 'have',correct: true, questions_id: 2)
Answer.create(answer: 'bring',correct: false, questions_id: 2)
Answer.create(answer: 'get',correct: false, questions_id: 2)
Answer.create(answer: 'make',correct: false, questions_id: 2)
Question.create(body: "Please don't forget to ring me when you _______ home", tests_id: 1)
Answer.create(answer: 'will get',correct: true, questions_id: 3)
Answer.create(answer: 'get',correct: false, questions_id: 3)
Answer.create(answer: 'are going to get',correct: false, questions_id: 3)
Answer.create(answer: 'are getting',correct: false, questions_id: 3)
