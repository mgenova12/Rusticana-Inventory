class ChangePortionSizeToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :prepcenter_products, :portion_size, :decimal
    add_column :store_goods, :measurement, :string
  end
end
