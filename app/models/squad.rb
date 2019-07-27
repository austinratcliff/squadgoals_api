class Squad < ApplicationRecord
  has_many :squad_members
  has_many :members, through: :squad_members
end
