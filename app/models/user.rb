class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :travels
  has_many :galleries
end
