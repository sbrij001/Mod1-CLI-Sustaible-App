class Location < ActiveRecord::Base
  has_many :facts
  has_many :user_locations
  has_many :users, through: :user_locations

  def coolfact
    #self.facts.each{ |obj| puts obj.fact}
    randNum =rand(0..self.facts.length-1)
    self.facts[randNum].fact
    #Location.first.facts[0].fact
  end
end


# place[0].facts.first.fact
# place = fla location instance arr
#[<inst>][0]
