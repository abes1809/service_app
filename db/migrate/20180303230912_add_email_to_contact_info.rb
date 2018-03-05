class AddEmailToContactInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_infos, :website, :string
  end
end
