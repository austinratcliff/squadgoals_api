class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_private
end
