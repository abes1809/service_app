class ContactInfo < ApplicationRecord
  has_many :user, dependent: :destroy
  has_many :law_services, dependent: :destroy
  has_many :mental_health_services, dependent: :destroy
  has_many :shelter_services, dependent: :destroy 
  
  geocoded_by :full_address 
  after_validation :geocode 

  enum prefered_contact_method: {email: 1, phone: 2, in_person: 3, other: 4}

end
