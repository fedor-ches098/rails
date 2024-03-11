# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
    {title: "Ruby"},
    {title: "Linux"}
])

users = User.create!([
    {name: "Fedor"},
    {name: "Masha"},
    {name: "Olga"}
])

answers = Answer.create!([
    {body: "puts", correct: true},
    {body: "get", correct: false},
    {body: "cd", correct: true},
    {body: "pwd", correct: false},
    {body: "hash", correct: true},
    {body: "array", correct: false},
    {body: "mkdir", correct: true},
    {body: "mk", correct: false}
])

questions = Question.create!([
    {body: "A command in Linux to change directory?"},
    {body: "Method in Ruby that is used to display the output of a program on the console?"},
    {body: "Dictionary-like collection of unique keys and their values in Ruby?"},
    {body: "A command-line utility that allows users to create new directories in Linux?"}
])

tests = Test.create!([
    {title: "Ruby for beginners", level: 1, category_id: categories[0].id, user_id: users[0].id},
    {title: "Linux for beginners", level: 1, category_id: categories[1].id, user_id: users[1].id}
])
