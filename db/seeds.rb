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
  phone: '(123) 456-7890',
  password: 'password',
  password_confirmation: 'password'
)

tyle = User.create(
  first_name: 'Tyle',
  last_name: 'Bivens',
  name: 'Tyle Bivens',
  email: 'tyle@example.com',
  phone: '(123) 456-7890',
  password: 'password',
  password_confirmation: 'password'
)

sierra = User.create(
  first_name: 'Sierra',
  last_name: 'Carter',
  name: 'Sierra Carter',
  email: 'sierra@example.com',
  phone: '(123) 456-7890',
  password: 'password',
  password_confirmation: 'password'
)

krissy = User.create(
  first_name: 'Krissy',
  last_name: 'Merritt',
  name: 'Krissy Merritt',
  email: 'krissy@example.com',
  phone: '(123) 456-7890',
  password: 'password',
  password_confirmation: 'password'
)

vision = Vision.create(
  user_id: austin.id,
  statement: 'I am 37 years old, living in Seattle, Washington with my husband and our dog(s), and working as a software developer for a creative company that inspires me each and every day.',
  timeframe: 10
)

category_career = Category.create(
  name: 'Career'
)

category_personal = Category.create(
  name: 'Personal'
)

goal_austin = Goal.create(
  user_id: austin.id,
  category_id: category_career.id,
  content: 'Code something',
  by_when: DateTime.now,
  is_private: false
)

goal_tyle = Goal.create(
  user_id: tyle.id,
  category_id: category_career.id,
  content: 'Film something',
  by_when: DateTime.now,
  is_private: false
)

goal_sierra = Goal.create(
  user_id: sierra.id,
  category_id: category_personal.id,
  content: 'Pet and love Benjy',
  by_when: DateTime.now,
  is_private: false
)

goal_krissy = Goal.create(
  user_id: krissy.id,
  category_id: category_personal.id,
  content: 'Play with and love Benjy',
  by_when: DateTime.now,
  is_private: false
)

sub_goal_austin = SubGoal.create(
  goal_id: goal_austin.id,
  content: 'Brainstorm with Tyle',
  is_complete: false
)

sub_goal_tyle = SubGoal.create(
  goal_id: goal_tyle.id,
  content: 'Brainstorm with Austin',
  is_complete: false
)

tag_tech = Tag.create(
  name: 'Tech'
)

tag_film = Tag.create(
  name: 'Film'
)

tagging_austin = Tagging.create(
  goal_id: goal_austin.id,
  tag_id: tag_tech.id
)

tagging_tyle = Tagging.create(
  goal_id: goal_tyle.id,
  tag_id: tag_film.id
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

squad_member = SquadMember.create(
  squad_id: squad.id,
  member_id: tyle.id
)

collaboration = Collaboration.create(
  message: "Let's brainstorm!",
  requester_id: austin.id,
  requestee_id: tyle.id,
  requester_goal_id: goal_austin.id,
  requestee_goal_id: goal_tyle.id,
  request_status_id: request_status.id
)

project = Project.create(
  user_id: austin.id,
  name: 'Brainstorm',
  description: 'A space to brainstorm apps, films, and other creative things',
  is_private: false
)

project_private = Project.create(
  user_id: tyle.id,
  name: 'Budget',
  description: 'Our plan to budget for our projects',
  is_private: true
)

project_girls = Project.create(
  user_id: sierra.id,
  name: 'Benjy',
  description: 'Pet, play with, and love Baby Benjy Boy',
  is_private: false
)

project_goal = ProjectGoal.create(
  project_id: project.id,
  content: 'Create a list of ideas to do together',
  by_when: DateTime.now,
  is_private: false
)

project_sub_goal = ProjectSubGoal.create(
  project_goal_id: project_goal.id,
  content: 'Schedule our first brainstorming session',
  is_complete: false
)

project_member_austin = ProjectMember.create(
  project_id: project.id,
  member_id: austin.id
)

project_member_tyle = ProjectMember.create(
  project_id: project.id,
  member_id: tyle.id
)

project_member_private_austin = ProjectMember.create(
  project_id: project_private.id,
  member_id: austin.id
)

project_member_private_tyle = ProjectMember.create(
  project_id: project_private.id,
  member_id: tyle.id
)

project_member_girls_sierra = ProjectMember.create(
  project_id: project_girls.id,
  member_id: sierra.id
)

project_member_girls_krissy = ProjectMember.create(
  project_id: project_girls.id,
  member_id: krissy.id
)

collaboration_goal = CollaborationGoal.create(
  project_id: project.id,
  requester_goal_id: goal_austin.id,
  requestee_goal_id: goal_tyle.id
)

collaboration_goal_private = CollaborationGoal.create(
  project_id: project_private.id,
  requester_goal_id: goal_austin.id,
  requestee_goal_id: goal_tyle.id
)

collaboration_goal_girls = CollaborationGoal.create(
  project_id: project_girls.id,
  requester_goal_id: goal_sierra.id,
  requestee_goal_id: goal_krissy.id
)
