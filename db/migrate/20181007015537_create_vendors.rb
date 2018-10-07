class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.integer :user_id
      t.string :company_name
      t.string :address
      t.integer :phone_number
      t.string :description
      t.string :email
      t.integer :availability

      t.timestamps
    end
  end
end
