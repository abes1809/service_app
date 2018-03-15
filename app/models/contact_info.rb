class ContactInfo < ApplicationRecord
  has_many :user
  has_many :law_services
  has_many :mental_health_services 
  has_many :shelter_services 

  enum prefered_contact_method: {email: 1, phone: 2, in_person: 3, other: 4}

end
