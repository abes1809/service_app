class CreateContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :prefered_contact_method

      t.timestamps
    end
  end
end
