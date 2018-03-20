class UserService < ApplicationRecord
  belongs_to :user 
  belongs_to :servicable, polymorphic: true 
  enum status: {not_contacted: 1, contacted: 2, intake_complete: 3}

  def show_match(user_service)

    service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

    # service_info = [service_info]

    service_info = [user_service] + [service_info]

    service_info

  end 

  def find_distance(user_service, user)

    service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

    service_latlog = Geocoder.coordinates("#{service_info.contact_info.address}, #{service_info.contact_info.city}, #{service_info.contact_info.state}")

    user_latlog = Geocoder.coordinates("#{user.contact_info.address}, #{user.contact_info.city}, #{user.contact_info.state}")

    user_lat = user_latlog[0]
    user_log = user_latlog[1]

    service_lat = service_latlog[0]
    service_log = service_latlog[1]

    puts "____MODEL WORKING______"

    sleep(5)

    response = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_lat},#{user_log}&destinations=#{service_lat}%2C#{service_log}&key=#{ENV['GOOGLE_API_KEY']}").body

    if response == "Google API error: over query limit."
      sleep(10)
      response = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_lat},#{user_log}&destinations=#{service_lat}%2C#{service_log}&key=#{ENV['GOOGLE_API_KEY']}").body
    end 

    if response == "Google API error: over query limit."
      sleep(10)
      response = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user_lat},#{user_log}&destinations=#{service_lat}%2C#{service_log}&key=#{ENV['GOOGLE_API_KEY']}").body
    end 


    distance_apart = response["rows"][0]["elements"][0]["distance"]["text"]

    puts distance_apart

    distance_apart

  end 

  def self.index_matches(user_services)
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


  # def self.service_categories(categories)

  #     # values = [law_services, mental_health_services, shelters]

  #     if categories == {shelter:true, law:true, mental:true }
  #       services = Shelter.all + LawService.all + MentalHealthService.all 

  #     elsif categories == {shelter:true, law:true, mental:"" }
  #       services = Shelter.all + LawService.all 

  #     elsif categories == {shelter:true, law:"", mental:true } 
  #       services = Shelter.all + MentalHealthService.all

  #     elsif categories == {shelter:"", law:true, mental:true }
  #       services = LawService.all + MentalHealthService.all

  #     elsif categories == {shelter:true, law:"", mental:"" }
  #       services = Shelter.all

  #     elsif categories == {shelter:"", law:true, mental:"" } 
  #       services = LawService.all 
      
  #     elsif categories == {shelter:"", law:"", mental:true }
  #       services = MentalHealthService.all
  #     end

  #   services

  # end 



end 



