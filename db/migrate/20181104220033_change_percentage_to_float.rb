class ChangePercentageToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :priorities, :percentage, :float
  end
end
