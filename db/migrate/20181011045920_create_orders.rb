class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total, precision: 9, scale: 2

      t.timestamps
    end
  end
end
