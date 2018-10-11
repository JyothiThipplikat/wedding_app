class CreateVendorTags < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_tags do |t|
      t.integer :vendor_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
