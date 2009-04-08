class Basket < ActiveRecord::Base
  belongs_to :shopping 
  belongs_to :product

end