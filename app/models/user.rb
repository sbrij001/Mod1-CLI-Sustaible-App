class User < ActiveRecord::Base
  has_many :user_locations
  has_many :locations, through: :user_locations

end


#method for so the user can access of it facts

#find a fact by date
