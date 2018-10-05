class Restaurant < ApplicationRecord
    has_many :chefs
    has_and_belongs_to_many :foods
end
