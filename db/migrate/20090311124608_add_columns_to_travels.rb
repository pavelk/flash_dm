class AddColumnsToTravels < ActiveRecord::Migration
  def self.up
    add_column :travels, :location, :text
    add_column :travels, :rules_confirm, :boolean
    add_column :travels, :approved, :boolean
    add_column :travels, :active, :boolean
  end

  def self.down
    remove_column :travels, :location
    remove_column :travels, :rules_confirm
    remove_column :travels, :approved
    remove_column :travels, :active
  end
end
