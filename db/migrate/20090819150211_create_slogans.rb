class CreateSlogans < ActiveRecord::Migration
  def self.up
    create_table :slogans do |t|
      t.integer :round_id
      t.string :name
      t.string :username
      t.string :address
      t.string :city
      t.integer :votes_count, :default => 0
    end
    add_index :slogans, :round_id
  end

  def self.down
    drop_table :slogans
  end
end