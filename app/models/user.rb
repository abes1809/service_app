class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info 
  has_many :user_services
  # has_many :law_services through: :servicable_ids

  validates :name, presence: true
  # validates :email, presence: true uniqueness: true

  # def self.from_token_request request
  #   # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
  #   # e.g.
  #     email = request.params["auth"] && request.params["auth"]["email"]
  #     self.find_by email: email
  # end

end 