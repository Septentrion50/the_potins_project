class Comment < ApplicationRecord

  validates :comment_type_type,
            presence: true

  validates :comment_type_id,
            presence: true

  validates :content,
            presence: true,
            length: { maximum: 200 }

  has_many :likes, as: :like_target
  belongs_to :user
  belongs_to :comment_type, polymorphic: true
  has_many :comments, as: :comment_type
end
