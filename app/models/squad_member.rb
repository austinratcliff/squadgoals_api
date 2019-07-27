class SquadMember < ApplicationRecord
  belongs_to :squad
  belongs_to :member, class_name: :User
end
