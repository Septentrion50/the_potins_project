class User < ApplicationRecord

  has_secure_password

  validates :first_name,
            presence: true

  validates :last_name,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/,
              message: 'email adress please'
            }

  validates :password,
            presence: true,
            length: { minimum: 6, maximum: 20 }

  validates :description,
            presence: true,
            length: { minimum: 20, maximum: 200 }

  has_many :gossips
  has_many :comments, as: :comment_type
  has_many :likes
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'

  def remember(remeber_token)
    remember_digest = BCrypt::Password.create(remeber_token)
    update(remember_digest: remember_digest)
  end
end
