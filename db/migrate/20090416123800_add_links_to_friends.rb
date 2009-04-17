class AddLinksToFriends < ActiveRecord::Migration
  def self.up
    add_column :friends, :gallery_link, :string
  end

  def self.down
    remove_column :friends, :gallery_link
  end
end
