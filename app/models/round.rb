class Round < ActiveRecord::Base
  
  has_many :slogans, :order => 'votes_count DESC'
  
end
