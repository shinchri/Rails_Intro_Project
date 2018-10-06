class AlterFood < ActiveRecord::Migration[5.2]
  def change
    remove_column("foods", "description")
  end
end
