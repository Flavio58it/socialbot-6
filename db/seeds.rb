# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
  email: ENV['DEMO_EMAIL'],
  password: ENV['DEMO_PASSWORD'],
  password_confirmation: ENV['DEMO_PASSWORD']
)

guest = User.create(
  email: "guest@email.com",
  password: "password",
  password_confirmation: "password"
)

products = Product.create([
  {
    name: "An example product",
    description: "Shows you what products look like",
    price: 1,
    url: 'www.google.com'
  },
  {
    name: "Food and wine education class",
    description: "One food and wine education class of your choice at New York Vintners (a $75 value)",
    price: 35,
    url: 'https://pulsd.com/new-york/promotions/35-dollars-for-one-wine-and-food-education-class-of-your-choice-at-new-york-vintners-a-75-dollars-value?inviter_id=342171'
  }
  ]
)
