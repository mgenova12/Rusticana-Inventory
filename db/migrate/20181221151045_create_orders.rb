class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :order_day

      t.timestamps
    end
  end
end
