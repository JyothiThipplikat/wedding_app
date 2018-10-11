class CreateCartedVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :carted_vendors do |t|
      t.string :status
      t.integer :order_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end
