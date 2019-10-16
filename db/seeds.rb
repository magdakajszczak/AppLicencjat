# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Java = Category.create(name: 'Java')
Ruby_On_Rails = Category.create(name: 'Ruby On Rails')
C = Category.create(name: 'C++')
Python = Category.create(name: 'Python')

Tag.create(name: "Przepisy")
Tag.create(name: "Informatyka")
Tag.create(name: "Ilustracje")
Tag.create(name: "Matematyka")