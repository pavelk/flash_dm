class Vote < ActiveRecord::Base
  
  belongs_to :slogan, :counter_cache => true
  
end
