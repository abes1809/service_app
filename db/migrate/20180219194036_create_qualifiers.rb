class CreateQualifiers < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifiers do |t|

      t.string :name
      t.integer :servicable_id
      t.string :servicable_type
      t.string :target_value
      t.string :data_form
      t.string :comparison
      
      t.timestamps
    end
  end
end
