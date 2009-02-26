class Photo < ActiveRecord::Base
  
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :photo, :styles => { :travel => "130x160#" },
                    :url  => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
                  
  validates_attachment_size :photo, :less_than => 3.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
  
end
