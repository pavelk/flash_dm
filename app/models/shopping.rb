class Shopping < ActiveRecord::Base
  belongs_to :user
  
  def deliver_shopping_list
    Notifier.deliver_shopping_list(self)
  end
  
end
