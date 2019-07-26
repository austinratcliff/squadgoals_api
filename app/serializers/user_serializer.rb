class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :email, :phone

  has_many :visions
  has_many :goals
  has_one :squad
  has_many :projects
end
