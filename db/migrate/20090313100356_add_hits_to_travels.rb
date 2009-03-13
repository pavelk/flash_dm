class AddHitsToTravels < ActiveRecord::Migration
  def self.up
    add_column :travels, :hits, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :travels, :hits
  end
end
