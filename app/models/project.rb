class Project < ApplicationRecord
  has_many :project_members
  has_many :members, through: :project_members
  has_one :collaboration_goal
  has_one :requester_goal, through: :collaboration_goal, source: :requester_goal
  has_one :requestee_goal, through: :collaboration_goal, source: :requestee_goal
end
