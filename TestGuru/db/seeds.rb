# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create!([
    {title: "Ruby"},
    {title: "Linux"}
])

users = User.create!([
    {name: "Fedor"},
    {name: "Masha"},
    {name: "Olga"}
])

tests = Test.create!([
    {title: "Ruby for beginners", level: 1, category_id: categories[0].id, author_id: users[0].id},
    {title: "Linux for beginners", level: 1, category_id: categories[1].id, author_id: users[1].id}
])

questions = Question.create!([
    {body: "A command in Linux to change directory?", test_id: tests[1].id},
    {body: "Method in Ruby that is used to display the output of a program on the console?", test_id: tests[0].id},
    {body: "Dictionary-like collection of unique keys and their values in Ruby?", test_id: tests[0].id},
    {body: "A command-line utility that allows users to create new directories in Linux?", test_id: tests[1].id}
])

answers = Answer.create!([
    {body: "puts", correct: true, question_id: questions[1].id},
    {body: "get", correct: false, question_id: questions[1].id},
    {body: "cd", correct: true, question_id: questions[0].id},
    {body: "pwd", correct: false, question_id: questions[0].id},
    {body: "hash", correct: true, question_id: questions[2].id},
    {body: "array", correct: false, question_id: questions[2].id},
    {body: "mkdir", correct: true, question_id: questions[3].id},
    {body: "mk", correct: false, question_id: questions[3].id}
])
