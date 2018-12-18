class RemovePreppedAddDistributor < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :prepped, :boolean
    add_column :products, :distributor, :string
  end
end
