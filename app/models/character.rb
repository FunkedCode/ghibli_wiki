class Character < ApplicationRecord
  has_one :film
  has_one :character_type
  has_one :location
  validates :name, uniqueness: true, presence: true
end
