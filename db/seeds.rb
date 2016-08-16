# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Child.destroy_all

a = User.create!(email: "haha@gmail.com", password: "azerty")

children_attributes = [
  {
    name:         "Lou",
    address:      "Carlton Lille",
    age:          6,
    sex:          "mignon",
    description:  "Petite fille joyeuse et pleine de vie",
    user:         a
  },
  {
    name:         "Pierre",
    address:      "12 rue du Général Leclercq, Arras",
    age:          10,
    sex:          "lisse",
    description:  "Aime bien jouer",
    user:         a
  },
]

children_attributes.each { |params| Child.create!(params) }
