class Article < ActiveRecord::Base
  
  has_attached_file :data, :styles => { :fullsize => "350x350>", :medium => "160x>", :thumb => "80x>" },
                    :url  => "/assets/articles/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"
                  
  validates_attachment_size :data, :less_than => 10.megabytes
  validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'application/octet-stream']
  
  def hit!
    self.class.increment_counter :hits, id
  end
  
end
