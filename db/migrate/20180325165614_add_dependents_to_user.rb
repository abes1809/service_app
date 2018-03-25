class AddDependentsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :children?, :boolean, default: false
  end
end
