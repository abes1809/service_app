class UserService < ApplicationRecord
  belongs_to :user 
  belongs_to :servicable, polymorphic: true 
  enum status: {not_contacted: 1, contacted: 2, intake_complete: 3}

  def self.service_matches(user_services)
    services = []

    user_services.each do |user_service|
      
      service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

      puts service_info.class 

      service_info = [service_info]

      user_info = [user_service]

      service_info = user_info + service_info
    
      services << service_info
    end

    services
  end

  def self.service_categories(params)

      if params == ("shelters")
        services = Shelter.all

      elsif params == ("mental_health_services")
        services = MentalHealthService.all

      elsif params == ("law_services")
        services = LawService.all

      elsif params == (["law_services", "mental_health_services"])
        services = LawService.all + MentalHealthService.all

      elsif params == (["law_services", "shelters"])
        services = LawService.all + Shelter.all

      elsif params == (["mental_health_services", "shelters"]) 
        services = MentalHealthService.all + Shelter.all

      elsif params == (["law_services", "mental_health_services", "shelters"])
        services = LawService.all + MentalHealthService.all? + Shelter.all 
      end

    services

  end 



end 



