class Product < ActiveRecord::Base
  
  has_many :baskets 
  has_many :shoppings, :through => :baskets
  
end
