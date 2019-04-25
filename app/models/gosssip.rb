class Gosssip < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :join_table_gossip_tags, dependent: :destroy
  has_many :tags, through: :join_table_gossip_tags
end
