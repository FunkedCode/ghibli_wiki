class CharacterType < ApplicationRecord
  has_many :characters
  has_many :films, through: :characters
  validates :name, presence: true, uniqueness: true
end
