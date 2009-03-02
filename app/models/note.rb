class Note < ActiveRecord::Base
  
  validates_presence_of :first_name, :surname, :email
  
  def deliver_write_us
    Notifier.deliver_write_us(self)
  end
  
end
