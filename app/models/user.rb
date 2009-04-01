class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :travels
  has_many :galleries
  has_many :shoppings
  
  def deliver_registration_mail
    Notifier.deliver_registration_mail(self)
  end
  
  def full_name 
    [first_name, last_name].join(" ") 
  end
  
end
