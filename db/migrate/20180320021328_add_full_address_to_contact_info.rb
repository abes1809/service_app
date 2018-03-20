class AddFullAddressToContactInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_infos, :full_address, :string
  end
end
