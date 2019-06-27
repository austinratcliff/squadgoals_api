# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

austin = User.create(
  first_name: 'Austin',
  last_name: 'Ratcliff',
  name: 'Austin Ratcliff',
  email: 'austin@example.com',
  phone: '1234567890',
  password: 'password',
  password_confirmation: 'password'
)

tyle = User.create(
  first_name: 'Tyle',
  last_name: 'Bivens',
  name: 'Tyle Bivens',
  email: 'tyle@example.com',
  phone: '1234567890',
  password: 'password',
  password_confirmation: 'password'
)
