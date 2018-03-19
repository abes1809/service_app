class UserService < ApplicationRecord
  belongs_to :user 
  belongs_to :servicable, polymorphic: true 
  enum status: {not_contacted: 1, contacted: 2, intake_complete: 3}

  def show_match(user_service, user)


    service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")


    service_latlog = Geocoder.coordinates("#{service_info.contact_info.address}, #{service_info.contact_info.city}, #{service_info.contact_info.state}")

    user_latlog = Geocoder.coordinates("#{user.contact_info.address}, #{user.contact_info.city}, #{user.contact_info.state}")

    user_lat = user_latlog[0]
    user_log = user_latlog[1]

    service_lat = service_latlog[0]
    service_log = service_latlog[1]

    puts "WORKING"


    response = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=miles&origins=#{user_lat},#{user_log}&destinations=#{service_lat}%2C#{service_log}&key=#{ENV['GOOGLE_API_KEY']}").body

    puts "WORKING"

    puts response["rows"]

    puts "WORKING"


    service_info = [service_info]

    user_info = [user_service]


    service_info = user_info + service_info

    service_info

  end 

  def self.service_matches(user_services)
    services = []

    user_services.each do |user_service|
      
      service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

      service_info = [service_info]

      user_info = [user_service]

      service_info = user_info + service_info
    
      services << service_info
    end

    services
  end


  def self.service_categories(params)

      # values = [law_services, mental_health_services, shelters]

      if params == (["true", "", ""])
        services = LawService.all

      elsif params == (["", "true", ""])
        services = MentalHealthService.all

      elsif params == (["", "", "true"])
        services = Shelter.all

      elsif params == (["true", "true", ""])
        services = LawService.all + MentalHealthService.all

      elsif params == (["true", "", "true"])
        services = LawService.all + Shelter.all

      elsif params == (["","true", "true"]) 
        services = MentalHealthService.all + Shelter.all

      elsif params == (["true", "true", "true"])
        services = LawService.all + MentalHealthService.all + Shelter.all 
      end

    services

  end 



end 



