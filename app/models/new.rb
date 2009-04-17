class New < ActiveRecord::Base
  
  has_attached_file :photo, :styles => { :fullsize => "350x350>", :medium => "280x280>", :thumb => "125x100#" },
                    :url  => "/assets/news/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/news/:id/:style/:basename.:extension"
                  
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
  
  def hit!
    self.class.increment_counter :hits, id
  end
  
end
