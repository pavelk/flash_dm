class AddCodeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :code, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :users, :code
  end
end
