class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info 
  has_many :user_services
  # has_many :law_services through: :servicable_ids

  validates :name, presence: true
  # validates :email, presence: true uniqueness: true

end 