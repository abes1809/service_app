class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info
  has_many :user_services, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum gender: {female: 1, male: 2, trans: 3}, _prefix: :gender
  enum sex: {female: 1, male: 2, intersex: 3}, _prefix: :sex

  def find_distance(user_service, user)

    service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

    sleep(3)

    service_latlog = Geocoder.coordinates("#{service_info.contact_info.address}, #{service_info.contact_info.city}, #{service_info.contact_info.state}")

    if service_latlog == "Google API error: over query limit."
      sleep(3)

      Geocoder.coordinates("#{service_info.contact_info.address}, #{service_info.contact_info.city}, #{service_info.contact_info.state}")
    end 

    sleep(3)

    user_latlog = Geocoder.coordinates("#{user.contact_info.address}, #{user.contact_info.city}, #{user.contact_info.state}")

    if user == "Google API error: over query limit."
      sleep(2)

      user_latlog = Geocoder.coordinates("#{service_info.contact_info.address}, #{service_info.contact_info.city}, #{service_info.contact_info.state}")
    end 

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

    distance_apart = response["rows"][0]["elements"][0]["distance"]["text"]

    puts distance_apart

    distance_apart

  end 

end 