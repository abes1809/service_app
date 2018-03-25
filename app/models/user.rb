class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info, dependent: :destroy
  has_many :user_services, dependent: :destroy

  validates :email, presence: true,  on: :create, uniqueness: true

  enum gender: {female: 1, male: 2, femme_trans: 3, masc_trans: 4, nonbinary: 5}, _prefix: :gender
  enum sex: {female: 1, male: 2, intersex: 3}, _prefix: :sex

  def find_address(contact_info)

    if contact_info.address 
      full_address = contact_info.address + ", " + contact_info.city + ", " + contact_info.state
    else
      full_address = contact_info.zip 
    end

    full_address   

  end 

  def find_distance(user_service, user)

    puts "HERERERE"

    service_info = eval("#{user_service.servicable_type}.find(#{user_service.servicable_id})")

    puts user.contact_info.latitude
    puts user.contact_info.longitude
    puts service_info.contact_info.longitude
    puts service_info.contact_info.latitude

    puts "Coordinates above"

    sleep(2)

    response = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{user.contact_info.latitude},#{user.contact_info.longitude}&destinations=#{service_info.contact_info.latitude}%2C#{service_info.contact_info.longitude}&key=#{ENV['GOOGLE_API_KEY']}").body

    puts "HERERERE"

    # puts response

    distance_apart = response["rows"][0]["elements"][0]["distance"]["text"]

    distance_apart = distance_apart.chomp(" mi")

    distance_apart

  end 

end 