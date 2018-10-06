class AlterRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column("restaurants", "description", :text)
    add_column("restaurants", "review", :text)
  end
end
