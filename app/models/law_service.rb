class LawService < ApplicationRecord
  belongs_to :contact_info 
  has_many :qualifers, as: :servicable
  has_many :user_services, as: :servicable

  def qualified_user?(user)
    qualified = true

    qualifiers.each do |qualifier|
      if qualifier.name == "annual_income"
        if ("(user.#{qualifier.name} * user.annual_income) #{qualifier.comparison} #{qualifier.target_value}")
          qualified = false
        end 
      elsif 
        unless eval("user.#{qualifier.name} #{qualifier.comparison} #{qualifier.target_value}")
          qualified = false
        end
      end
    end

    qualified
  end

end
