class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  belongs_to :mod
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :posts, through: :likes
end
