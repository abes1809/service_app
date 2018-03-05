class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info 
  has_many :user_services
  # has_many :law_services through: :servicable_ids

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum gender: {femine: 1, masculine: 2, trans: 3}
  enum sex: {female: 1, male: 2, intersex: 3}


  def self.low_income(annual_income)

    low_income = false 

    if annual_income == 27650 && current_user.household_size == 1 
      low_income = true 
    elsif annual_income == 37920 && current_user.household_size == 2
      low_income = true 
    elsif annual_income == 42680 && current_user.household_size == 3
      low_income = true 
    elsif annual_income == 47400 && current_user.household_size == 4
      low_income = true 
    elsif annual_income == 51240 && current_user.household_size >= 5
      low_income = true 
    end 

    low_income

  end
  
end

  


end 