class Rating < ActiveRecord::Base
  
  belongs_to :ratingable, :polymorphic => true
  
end
