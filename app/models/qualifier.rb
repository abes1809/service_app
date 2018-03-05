class Qualifier < ApplicationRecord
  belongs_to :servicable, polymorphic: true

end 