class Restaurant < ApplicationRecord
    has_many :chefs
    has_and_belongs_to_many :foods

    validates :name, presence: true
    validates :address, presence: true
end
