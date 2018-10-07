class AddChangesToVendors < ActiveRecord::Migration[5.2]
  def change
    change_column :vendors, :phone_number, :string
    remove_column :vendors, :availability, :integer
    add_column :vendors, :availability, :boolean, default: true
  end
end
