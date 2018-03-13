class MentalHealthService < ApplicationRecord
  belongs_to :contact_info 
  has_many :qualifiers, as: :servicable
  has_many :user_services, as: :servicable

  def qualified_user?(user)
    qualified = true

    qualifiers.each do |qualifier|
      p qualifier.id
      unless eval("user.#{qualifier.name} #{qualifier.comparison} #{qualifier.target_value}")
        qualified = false
      end
    end

    qualified
  end
  
end
