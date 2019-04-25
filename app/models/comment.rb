class Comment < ApplicationRecord
  belongs_to :gosssip
  belongs_to :user
  has_many :likes, as: :likeable
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
