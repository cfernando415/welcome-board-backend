class User < ApplicationRecord
  belongs_to :mod
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :posts, through: :likes
end
