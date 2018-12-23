class DropTablePreppedStore < ActiveRecord::Migration[5.0]
  def change
    drop_table :prepped_store_goods
  end
end
