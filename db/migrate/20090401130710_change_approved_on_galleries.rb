class ChangeApprovedOnGalleries < ActiveRecord::Migration
  def self.up
    remove_column :galleries, :approved
  end

  def self.down
  end
end
