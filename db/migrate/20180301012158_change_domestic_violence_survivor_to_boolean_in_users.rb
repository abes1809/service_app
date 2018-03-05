class ChangeDomesticViolenceSurvivorToBooleanInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :domestic_violence_survivor, :integer
    add_column :users, :domestic_violence_survivor, :boolean, default: false
  end
end
