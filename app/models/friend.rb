class Friend < ActiveRecord::Base
  
  def deliver_send_to_friend
    Notifier.deliver_send_to_friend(self)
  end
  
end
