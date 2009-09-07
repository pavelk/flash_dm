class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :news
  has_many :travels
  has_many :galleries
  has_many :shoppings
  
  def deliver_registration_mail
    Notifier.deliver_registration_mail(self)
  end
  
  def full_name 
    [first_name, last_name].join(" ") 
  end
  
  def self.search(search, order)
    if search
      find(:all, :conditions => ['login LIKE ? OR city LIKE ? OR email LIKE ? OR street LIKE ? OR first_name LIKE ? OR last_name LIKE ?', 
                                 "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%"],
                                  :order => order)
    else
      find(:all, :order => order)
    end
  end
  
end
