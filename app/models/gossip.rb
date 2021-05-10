class Gossip < ApplicationRecord
  has_many :likes
  belongs_to :user
  belongs_to :tag, optional: true
  has_many :comments, as: :comment_type
end
