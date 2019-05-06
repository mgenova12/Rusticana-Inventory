class AddVerifiedAndActionToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :verified, :boolean
    add_column :inventories, :corrective_action, :string
  end
end
