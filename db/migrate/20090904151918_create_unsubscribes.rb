class CreateUnsubscribes < ActiveRecord::Migration
  def self.up
    create_table :unsubscribes do |t|
      t.string :email
      t.boolean :unsubscribe
      t.timestamps
    end
  end

  def self.down
    drop_table :unsubscribes
  end
end
