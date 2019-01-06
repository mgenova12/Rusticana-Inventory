class RenameCaseQuantityToPrepcenterProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :prepcenter_products, :case_qantity, :case_quantity
  end
end
