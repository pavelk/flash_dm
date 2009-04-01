class ApprovedToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :approved, :boolean, :null => false, :default => true
  end

  def self.down
  end
end
