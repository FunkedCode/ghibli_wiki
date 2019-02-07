class Location < ApplicationRecord
  has_one :film
  has_many :characters
  validates :name, presence: true, uniqueness: true
end
