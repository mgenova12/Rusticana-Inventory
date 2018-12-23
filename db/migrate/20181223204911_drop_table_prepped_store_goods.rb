class DropTablePreppedStoreGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :prepcenter_product_id, :integer
  end
end
