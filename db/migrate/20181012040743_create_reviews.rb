class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :vendor_id
      t.string :post
      t.date :date

      t.timestamps
    end
  end
end
