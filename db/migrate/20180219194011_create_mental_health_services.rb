class CreateMentalHealthServices < ActiveRecord::Migration[5.1]
  def change
    create_table :mental_health_services do |t|
      
      t.string :name
      t.integer :contact_info_id
      t.string :specialty

      t.timestamps
    end
  end
end
