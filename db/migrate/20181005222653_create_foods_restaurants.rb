class CreateFoodsRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :foods_restaurants, id: false do |t|
      t.belongs_to :restaurant, index: true
      t.belongs_to :food, index: true
    end
  end
end
