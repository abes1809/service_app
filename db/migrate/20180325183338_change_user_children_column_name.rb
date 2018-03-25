class ChangeUserChildrenColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :children?, :children
  end
end
