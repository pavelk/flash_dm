class Slogan < ActiveRecord::Base
  
  has_many :votes
  belongs_to :round
  
  def votes_total
    Vote.all.size
  end  
    
end
