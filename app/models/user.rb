class User < ApplicationRecord
  has_secure_password

  belongs_to :contact_info 
  has_many :user_services

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum gender: {female: 1, male: 2, trans: 3}, _prefix: :gender
  enum sex: {female: 1, male: 2, intersex: 3}, _prefix: :sex
end 