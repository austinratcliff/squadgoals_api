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

category = Category.create(
  name: 'Career'
)

goal_austin = Goal.create(
  user_id: austin.id,
  category_id: category.id,
  content: 'Code something.',
  by_when: DateTime.now,
  is_private: false
)

goal_tyle = Goal.create(
  user_id: tyle.id,
  category_id: category.id,
  content: 'Film something.',
  by_when: DateTime.now,
  is_private: false
)

sub_goal_austin = SubGoal.create(
  goal_id: goal_austin.id,
  content: 'Brainstorm with Tyle.',
  is_complete: false
)

sub_goal_tyle = SubGoal.create(
  goal_id: goal_tyle.id,
  content: 'Brainstorm with Austin.',
  is_complete: false
)

tag_austin = Tag.create(
  name: 'Software'
)

tag_tyle = Tag.create(
  name: 'Film'
)

tagging_austin = Tagging.create(
  goal_id: goal_austin.id,
  tag_id: tag_austin.id
)

tagging_tyle = Tagging.create(
  goal_id: goal_tyle.id,
  tag_id: tag_tyle.id
)

cheer = Cheer.create(
  user_id: austin.id,
  goal_id: goal_tyle.id
)

request_status = RequestStatus.create(
  name: 'Yes'
)

connection = Connection.create(
  requester_id: austin.id,
  requestee_id: tyle.id,
  request_status_id: request_status.id
)

squad = Squad.create(
  user_id: austin.id
)
