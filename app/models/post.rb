class Post < ApplicationRecord
  belongs_to :user
  belongs_to :mod
  has_many :likes
  has_many :users, through: :likes
end
