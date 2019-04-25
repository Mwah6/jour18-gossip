class Tag < ApplicationRecord
  has_many :join_table_gossip_tags, dependent: :destroy
  has_many :gosssips, through: :join_table_gossip_tags
end
