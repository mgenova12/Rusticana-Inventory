class AddTotalAndPaidToORder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :paid, :boolean
    add_column :orders, :sale_total, :decimal, :precision => 6, :scale => 2
  end
end
