class AddUserIdToCartedVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :carted_vendors, :user_id, :integer
  end
end
