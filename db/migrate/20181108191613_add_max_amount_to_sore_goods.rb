class AddMaxAmountToSoreGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :max_amount, :integer
  end
end
