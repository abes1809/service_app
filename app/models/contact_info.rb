class ContactInfo < ApplicationRecord
  has_many :users
  has_many :law_services
  has_many :mental_health_services
  has_many :shelter_services 
  
  geocoded_by :full_address 
  # after_save :geocode
  after_validation :geocode

  enum prefered_contact_method: {email: 1, phone: 2, in_person: 3, other: 4}

end
