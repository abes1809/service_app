class UserService < ApplicationRecord
  belongs_to :User 
  belongs_to :servicable, polymorphic: true 

end
