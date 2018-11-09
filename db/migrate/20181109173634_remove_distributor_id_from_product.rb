class RemoveDistributorIdFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :distributor_id, :integer
  end
end
