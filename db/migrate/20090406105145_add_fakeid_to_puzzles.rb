class AddFakeidToPuzzles < ActiveRecord::Migration
  def self.up
    add_column :puzzles, :fake_id, :string
  end

  def self.down
    remove_column :puzzles, :fake_id
  end
end
