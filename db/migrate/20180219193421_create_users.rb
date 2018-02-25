class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :contact_info_id
      t.integer :gender
      t.integer :sex
      t.date :homeless_date
      t.integer :domestic_violence_survivor
      t.decimal :annual_income, precision: 10, scale: 2
      t.string :password_digest
      t.timestamps
    end
  end
end
