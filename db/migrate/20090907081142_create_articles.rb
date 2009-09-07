class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :perex
      t.text :description
      t.integer :hits, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
