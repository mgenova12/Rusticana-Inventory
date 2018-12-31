class ChangeDecmialPrecisionPortionSize < ActiveRecord::Migration[5.0]
  def change
    change_column :prepcenter_products, :portion_size, :decimal, :precision => 6, :scale => 2
  end
end
