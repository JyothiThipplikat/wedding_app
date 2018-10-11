class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :vendor_id
      t.string :url
      t.boolean :primary_image

      t.timestamps
    end
  end
end
