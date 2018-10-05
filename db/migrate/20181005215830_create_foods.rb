class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.text :recipe
      t.decimal :price

      t.timestamps
    end
  end
end
