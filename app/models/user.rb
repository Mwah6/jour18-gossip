class User < ApplicationRecord
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  # has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  belongs_to :city
  has_many :gosssips
  has_many :comments
  has_many :likes
  has_many :recipients, dependent: :destroy
  has_many :private_messages, through: :recipients

end
