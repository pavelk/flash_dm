class AddHitsAndRatingToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :hits, :integer, :null => false, :default => 0
    Gallery.add_ratings_columns
  end

  def self.down
    remove_column :galleries, :hits
    Gallery.remove_ratings_columns
  end
end
