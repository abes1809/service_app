class UserService < ApplicationRecord
  belongs_to :user 
  belongs_to :servicable, polymorphic: true 
  enum status: {not_contacted: 1, contacted: 2, intake_complete: 3}

  def self.service_matches(user_services)
    services = []

    user_services.each do |user_service|
      
      service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")
    
      services << service_info
    end
    services
  end



end 



