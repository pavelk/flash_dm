class CreatePuzzles < ActiveRecord::Migration
  def self.up
    create_table :puzzles do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :puzzles
  end
end
