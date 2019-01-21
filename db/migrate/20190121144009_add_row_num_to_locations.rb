class AddRowNumToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :row_num, :integer
  end
end
