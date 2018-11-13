class CreateSavedPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_prices do |t|
      t.string :status

      t.timestamps
    end
  end
end
