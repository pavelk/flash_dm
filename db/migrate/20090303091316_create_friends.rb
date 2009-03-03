class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :recipient_mail
      t.string :sender_mail
      t.string :sender_name
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end