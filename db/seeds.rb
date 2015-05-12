# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Score.delete_all
Score.create! id: 1, name: "Felicia", score: 13
Score.create! id: 2, name: "Riady", score: 3
Score.create! id: 3, name: "Katrina", score: 5
Score.create! id: 4, name: "Stewart", score: 5
Score.create! id: 5, name: "Felicia", score: 4
Score.create! id: 6, name: "John", score: 2
