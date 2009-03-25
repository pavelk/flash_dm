class Photo < ActiveRecord::Base
  
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :photo, :styles => { :travel_big => "220x172#", :travel_thumb => "x45>", :travel_list => "x90>", :travel_fridge => "79x58#" },
                    :url  => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
                  
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
  
=begin  
  before_create :randomize_file_name
  
  def randomize_file_name 
    extension = self.photo_file_name.scan(/\.\w+$/).to_s.downcase 
    self.photo_file_name = "#{self.id}#{extension}" 
  end
=end
  
end
