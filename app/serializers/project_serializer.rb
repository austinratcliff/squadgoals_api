class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_private, :members, :collaboration_goals

  def members
    return object.members.map do |member|
      member.slice(:id, :name)
    end
  end

  def collaboration_goals
    return {
      requester_goal: object.requester_goal.slice(:id, :content, :by_when, :is_private),
      requestee_goal: object.requestee_goal.slice(:id, :content, :by_when, :is_private)
    }
  end
end
