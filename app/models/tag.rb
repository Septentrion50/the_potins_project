class Tag < ApplicationRecord

  validates :title,
            presence: true,
            length: { minimum: 3, maximum: 20 }

  has_many :gossips
end
