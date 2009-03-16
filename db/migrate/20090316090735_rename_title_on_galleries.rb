class RenameTitleOnGalleries < ActiveRecord::Migration
  def self.up
    rename_column :galleries, :title, :city 
  end

  def self.down
    rename_column :galleries, :city, :title
  end
end
