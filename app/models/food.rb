class Food < ApplicationRecord
  has_and_belongs_to_many :restaurants

  validates :name, presence: true
  validates :description, presence: true
  validates :recipe, presence: true
  validates :price, presence: true
  validates :price,
end
