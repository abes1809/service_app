class ContactInfo < ApplicationRecord
  has_many :user 
  has_many :law_services
  has_many :mental_health_services 
  has_many :shelter_services 

  validates :email, presence: true, uniqueness: true

  def contact_info_id 
    contact_info_id = self.id 
    return contact_info_id
  end

end
