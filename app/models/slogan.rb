class Slogan < ActiveRecord::Base
  
  has_many :votes
  belongs_to :round
    
end
