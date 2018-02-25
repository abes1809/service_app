class CreateShelters < ActiveRecord::Migration[5.1]
  def change
    create_table :shelters do |t|
      t.string :name
      t.integer :contact_info_id
      t.string :specialty
      
      t.timestamps
    end
  end
end
