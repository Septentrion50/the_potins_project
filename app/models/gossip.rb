class Gossip < ApplicationRecord

  validates :title,
            presence: true,
            length: { minimum: 3, maximum: 14 }

  validates :content,
            presence: true

  has_many :likes, as: :like_target
  belongs_to :user
  belongs_to :tag, optional: true
  has_many :comments, as: :comment_type
end
