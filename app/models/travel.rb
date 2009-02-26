class Travel < ActiveRecord::Base
  
  belongs_to :user
  has_many :photos, :as => :attachable, :dependent => :destroy
  #before_create :add_user_to_travel
  
  private
  
    def add_user_to_travel
      #self.user_id = current_user.id
    end  
  
end
