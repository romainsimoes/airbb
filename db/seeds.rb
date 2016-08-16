# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Child.destroy_all

a = User.create!(email: "hahaha@gmail.com", password: "azerty")

children_attributes = [
  {
    name:         "Louis",
    address:      "11 rue de Carlton, Lille",
    age:          6,
    sex:          "M",
    description:  "Joyeuse et pleine de vie",
    user:         a
  },
  {
    name:         "Pierre",
    address:      "12 rue du Général Leclercq, Arras",
    age:          8,
    sex:          "M",
    description:  "Aime bien jouer",
    user:         a
  },
  {
    name:         "Jeanne",
    address:      "13 rue des poules, Merlimont",
    age:          11,
    sex:          "F",
    description:  "Utile et passionnée",
    user:         a
  },
  {
    name:         "Carla",
    address:      "13 rue de l'élysée, Paris",
    age:          10,
    sex:          "F",
    description:  "Tendre et affectueuse",
    user:         a
  },
  {
    name:         "Jhonny",
    address:      "13 rue de l'olympia, Paris",
    age:          7,
    sex:          "M",
    description:  "Sympa et bon chanteur",
    user:         a
  },
   {
    name:         "Julia",
    address:      "13 rue de lia ju, Lille",
    age:          8,
    sex:          "F",
    description:  "Petite et flexible",
    user:         a
  },
]

children_attributes.each { |params| Child.create!(params) }
