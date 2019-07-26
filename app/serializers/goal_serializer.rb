class GoalSerializer < ActiveModel::Serializer
  attributes :id, :content, :by_when, :is_private
end
