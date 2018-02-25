class Shelter < ApplicationRecord
  belongs_to :contact_info 
  has_many :qualifers, as: :servicable
 
end
