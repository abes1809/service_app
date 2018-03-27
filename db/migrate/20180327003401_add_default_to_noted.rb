class AddDefaultToNoted < ActiveRecord::Migration[5.1]
  def change
    change_column :user_services, :notes, :string, default: "You have no notes. Add some below!"
  end
end
