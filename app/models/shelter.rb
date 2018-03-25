class Shelter < ApplicationRecord
  belongs_to :contact_info, dependent: :destroy
  has_many :qualifiers, as: :servicable
  has_many :user_services, as: :servicable

  def qualified_user?(user, service)
    qualified = true

    if user.children == true 
      puts "found children true________________"

      if service.child_friendly == true 
        qualifiers.each do |qualifier|
          puts "found service children child_friendly true"
          unless eval("user.#{qualifier.name} #{qualifier.comparison} #{qualifier.target_value}")
            qualified = false
          end
        end 

      elsif service.child_friendly == false 
        puts "false path______________________"
        qualified = false
      end 

    else 
      puts "OTHER PATH RAN"

      qualifiers.each do |qualifier|
        unless eval("user.#{qualifier.name} #{qualifier.comparison} #{qualifier.target_value}")
          qualified = false
        end
      end 

    end 
    qualified
  end

end
