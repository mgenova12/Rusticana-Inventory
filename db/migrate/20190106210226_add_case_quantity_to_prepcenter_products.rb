class AddCaseQuantityToPrepcenterProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :prepcenter_products, :case_qantity, :integer
  end
end
