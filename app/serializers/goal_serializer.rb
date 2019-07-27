class GoalSerializer < ActiveModel::Serializer
  attributes :id, :content, :by_when, :is_private, :category, :tags, :cheers, :sub_goals

  def category
    return object.category.slice(:id, :name)
  end

  def tags
    return object.tags.map do |tag|
      tag.slice(:id, :name)
    end
  end

  def cheers
    return object.cheers.count
  end

  def sub_goals
    return object.sub_goals.map do |sub_goal|
      sub_goal.slice(:id, :content, :is_complete)
    end
  end
end
