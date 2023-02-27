class Tag < ApplicationRecord
  has_many :plant_tags, dependent: :destroy
  has_many :plants, through: :plant_tags
  validates :name, presence: true, length: { minimum: 2 }
end
