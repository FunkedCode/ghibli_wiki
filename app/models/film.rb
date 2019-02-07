class Film < ApplicationRecord
  has_many :characters
  has_one :location
  has_many :character_types, through: :characters
  validates :title, uniqueness: true, presence: true
end
