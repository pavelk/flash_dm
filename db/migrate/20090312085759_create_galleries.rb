class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :user_id
      t.string :title
      t.string :author_name
      t.string :author_age
      t.boolean :user_confirm, :null => false, :default => true
      t.boolean :approved, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end