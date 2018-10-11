class AddChangesToTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :specialty, :string
    add_column :tags, :specialty, :boolean
  end
end
