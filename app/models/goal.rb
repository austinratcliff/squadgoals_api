class Goal < ApplicationRecord
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :cheers
  has_many :sub_goals
end
