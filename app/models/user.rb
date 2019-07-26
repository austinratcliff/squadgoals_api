class User < ApplicationRecord
  has_secure_password

  has_many :visions
  has_many :goals
  has_one :squad
  has_many :projects
end
