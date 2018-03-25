class AddIdAndInsuranceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo_id, :boolean
    add_column :users, :insurance, :boolean
  end
end
