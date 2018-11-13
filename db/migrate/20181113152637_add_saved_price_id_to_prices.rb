class AddSavedPriceIdToPrices < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :saved_price_id, :integer

  end
end
