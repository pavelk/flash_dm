class Travel < ActiveRecord::Base
  acts_as_rated
  
  belongs_to :user
  has_many :photos, :as => :attachable, :dependent => :destroy

  def hit!
    self.class.increment_counter :hits, id
  end
 
  
end
