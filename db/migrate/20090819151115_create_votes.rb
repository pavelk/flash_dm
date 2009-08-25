class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :slogan_id
      t.string :vote_ip
      t.datetime :created_at
    end
    add_index :votes, :slogan_id
    add_index :votes, :vote_ip
    add_index :votes, :created_at
  end

  def self.down
    drop_table :votes
  end
end