class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :mod
  has_many :likes
  has_many :users, through: :likes
end
