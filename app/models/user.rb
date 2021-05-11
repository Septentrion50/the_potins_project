class User < ApplicationRecord

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  validates :description,
            presence: true,
            length: { minimum: 20, maximum: 200 }

  has_many :gossips
  has_many :comments, as: :comment_type
  has_many :likes
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'
end
