class AddDependentsToShelter < ActiveRecord::Migration[5.1]
  def change
    add_column :shelters, :child_friendly, :boolean, default: false
  end
end
