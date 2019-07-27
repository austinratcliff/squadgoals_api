class CollaborationGoal < ApplicationRecord
  belongs_to :project
  belongs_to :requester_goal, class_name: :Goal
  belongs_to :requestee_goal, class_name: :Goal
end
