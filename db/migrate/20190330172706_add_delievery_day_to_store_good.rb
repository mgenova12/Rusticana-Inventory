class AddDelieveryDayToStoreGood < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :delivery_day, :string
    remove_column :products, :delivery_day, :string
  end
end
