class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.text :perex
      t.text :description
      t.integer :hits, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end