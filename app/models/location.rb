class Location < ApplicationRecord
  belongs_to :film
  validates :name, presence: true, uniqueness: true
end
