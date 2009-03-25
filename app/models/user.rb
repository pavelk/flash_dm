class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :travels
  has_many :galleries
  has_many :shoppings
  
  def deliver_registration_mail
    Notifier.deliver_registration_mail(self)
  end
  
end
