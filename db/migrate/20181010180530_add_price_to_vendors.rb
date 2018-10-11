class AddPriceToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :price, :decimal, precision: 9, scale: 2
  end
end
