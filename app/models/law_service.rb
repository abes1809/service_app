class LawService < ApplicationRecord
  belongs_to :contact_info 
  has_many :qualifers, as: :servicable

end
