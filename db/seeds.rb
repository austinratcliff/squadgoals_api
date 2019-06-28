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

vision = Vision.create(
  user_id: austin.id,
  statement: 'I am 36 years old, living in Seattle, Washington with my husband and our dog(s), and working as a software developer for a creative company that inspires me each and every day.',
  timeframe: 10
)

goal_austin = Goal.create(
  user_id: austin.id,
  category_id: 0,
  content: 'Code something.',
  by_when: DateTime.now,
  is_private: false
)

goal_tyle = Goal.create(
  user_id: tyle.id,
  category_id: 0,
  content: 'Film something.',
  by_when: DateTime.now,
  is_private: false
)
