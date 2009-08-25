class Gallery < ActiveRecord::Base
  acts_as_rated
  
  belongs_to :user
  
  has_attached_file :photo, :styles => { :fullsize => "350x350>", :medium => "280x280>", :thumb => "125x100#", :fridge => "68x51#" },
                    :url  => "/assets/galleries/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/galleries/:id/:style/:basename.:extension"
                  
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
 
  #before_create :randomize_file_name
 
  def hit!
    self.class.increment_counter :hits, id
  end
  
  def self.search(search, order)
    if search
      find(:all, :conditions => ['author_name LIKE ? OR city LIKE ? OR author_age LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"], :order => order)
    else
      find(:all, :order => order)
    end
  end
  
  private

    def randomize_file_name
      #extension = File.extname(image_file_name).downcase
      extension = self.photo_file_name.scan(/\.\w+$/).to_s.downcase 
      self.photo.instance_write(:photo, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
    end
  
end
