class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info 
  has_many :user_services

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum gender: {female: 1, male: 2, trans: 3}, _prefix: :gender
  enum sex: {female: 1, male: 2, intersex: 3}, _prefix: :sex

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
        services = LawService.all + MentalHealthService.all + Shelter.all 
      end

    services

  end 

end 