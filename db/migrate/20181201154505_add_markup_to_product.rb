class AddMarkupToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :product_type, :string
    remove_column :products, :protion_size, :integer
    remove_column :prepcenter_products, :markup, :decimal
  end
end
