class Gallery < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, :styles => { :fullsize => "350x350>", :medium => "280x280>", :thumb => "125x125>" },
                    :url  => "/assets/galleries/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/galleries/:id/:style/:basename.:extension"
                  
  validates_attachment_size :photo, :less_than => 3.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
  
end
