class PrivateMessage < ApplicationRecord

  validates :content,
            presence: true,
            length: { maximum: 2000 }

  validates :sender_id,
            presence: true

  validates :recipient_id,
            presence: true

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
