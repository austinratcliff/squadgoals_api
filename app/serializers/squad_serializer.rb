class SquadSerializer < ActiveModel::Serializer
  attributes :id, :members

  def members
    return object.members.map do |member|
      member.slice(:id, :name)
    end
  end
end
