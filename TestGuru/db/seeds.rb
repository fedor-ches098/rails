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
Badge.destroy_all

badges = Badge.create!([
    {name: "All backend tests passed!", rule: "backend_category", value: "Backend", image_url: "https://png.pngtree.com/element_pic/00/16/07/18578cd65e6ecaa.jpg"},
    {name: "First try test passed!", rule: "first_try", value: "1", image_url: "https://w7.pngwing.com/pngs/557/291/png-transparent-red-ribbon-illustration-blue-ribbon-ribbon-badge-blue-ribbon-medal-thumbnail.png"},
    {name: "All level tests passed!", rule: "certain_level", value: "2", image_url: "https://png.pngtree.com/png-vector/20210206/ourmid/pngtree-award-badge-symbol-design-template-vector-png-image_2889870.jpg"}
])

categories = Category.create!([
    {title: "Frontend"},
    {title: "Linux"},
    {title: "Backend"}
])

users = User.create!([
  {email: "valeria@gmail.com", first_name: "Valeria", last_name: "Glumova", password: "123456", type: 'Admin', confirmed_at: Time.now},
  {email: "katerit@gmail.com", first_name: "Kate", last_name: "Ivanova", password: "123456", confirmed_at: Time.now},
  {email: "fedor@gmail.com", first_name: "Fedor", last_name: "Chesnokov", password: "123456", type: 'Admin', confirmed_at: Time.now},
  {email: "anna@gmail.com", first_name: "Anna", last_name: "Sharabanova", password: "123456", confirmed_at: Time.now}
])

tests = Test.create!([
    {title: "Ruby for beginners", level: 1, category_id: categories[2].id, author_id: users[0].id, public: true},
    {title: "Linux for beginners", level: 1, category_id: categories[1].id, author_id: users[0].id, public: true},
    {title: "Python for beginners", level: 2, category_id: categories[2].id, author_id: users[2].id, public: true},
    {title: "Javascript for beginners", level: 2, category_id: categories[0].id, author_id: users[2].id, public: true}
])

questions = Question.create!([
    {body: "A command in Linux to change directory?", test_id: tests[1].id},
    {body: "Method in Ruby that is used to display the output of a program on the console?", test_id: tests[0].id},
    {body: "Dictionary-like collection of unique keys and their values in Ruby?", test_id: tests[0].id},
    {body: "A command-line utility that allows users to create new directories in Linux?", test_id: tests[1].id},
    {body: "How to create a tuple in Python?", test_id: tests[2].id},
    {body: "How to display the output of a program on the console in JS?", test_id: tests[3].id}
])

answers = Answer.create!([
    {body: "puts", correct: true, question_id: questions[1].id},
    {body: "get", correct: false, question_id: questions[1].id},
    {body: "cd", correct: true, question_id: questions[0].id},
    {body: "pwd", correct: false, question_id: questions[0].id},
    {body: "hash", correct: true, question_id: questions[2].id},
    {body: "array", correct: false, question_id: questions[2].id},
    {body: "mkdir", correct: true, question_id: questions[3].id},
    {body: "mk", correct: false, question_id: questions[3].id},
    {body: "[]", correct: false, question_id: questions[4].id},
    {body: "()", correct: true, question_id: questions[4].id},
    {body: "console.log", correct: true, question_id: questions[5].id},
    {body: "log", correct: false, question_id: questions[5].id}
])
