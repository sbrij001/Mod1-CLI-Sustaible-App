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


  # def coolfact
  #   facts_arr = self.facts
  #   i = 0
  #   return_fact = []
  #   while i < facts_arr.length
  #      facts_arr.map do |fact_inst|
  #       return_fact <<  fact_inst.fact
  #      end
  #     i += 1
  #   end
  #   puts return_fact
  # end

end


# place[0].facts.first.fact
# place = fla location instance arr
#[<inst>][0]
