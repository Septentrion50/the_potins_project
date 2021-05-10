class User < ApplicationRecord
  has_many :gossips
  has_many :comments, as: :comment_type
  has_many :likes
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'
end
