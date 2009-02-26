class AddDataToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :family_name, :string
    add_column :users, :city, :string
  end

  def self.down
    remove_column :users, :family_name
    remove_column :users, :city
  end
end
