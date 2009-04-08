class Shopping < ActiveRecord::Base
  belongs_to :user
  
  has_many :baskets 
  has_many :products, :through => :baskets
  
  def deliver_shopping_list
    Notifier.deliver_shopping_list(self)
  end
  
end
