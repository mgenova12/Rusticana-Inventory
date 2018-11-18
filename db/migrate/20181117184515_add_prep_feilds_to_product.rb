class AddPrepFeildsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :markup, :decimal
    add_column :products, :product_type, :string
    add_column :products, :protion_size, :integer
  end
end
