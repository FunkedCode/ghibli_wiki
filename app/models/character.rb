class Character < ApplicationRecord
  belongs_to :film
  belongs_to :character_type
  validates :name, uniqueness: true, presence: true
end
