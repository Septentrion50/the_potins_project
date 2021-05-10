class Comment < ApplicationRecord
  has_many :likes
  belongs_to :user
  belongs_to :comment_type, polymorphic: true
  has_many :comments, as: :comment_type
end
