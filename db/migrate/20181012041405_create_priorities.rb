class CreatePriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :priorities do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :percentage

      t.timestamps
    end
  end
end
