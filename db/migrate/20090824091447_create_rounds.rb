class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.datetime :date_from
      t.datetime :date_till
    end
  end

  def self.down
    drop_table :rounds
  end
end