class AddHouseHoldSizeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :household_size, :integer
  end
end
