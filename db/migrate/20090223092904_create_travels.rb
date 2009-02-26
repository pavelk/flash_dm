class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :duration
      t.string :difficulty
      t.integer :rating
      t.timestamps
    end
    add_index :travels, :user_id
    add_index :travels, :rating
    add_index :travels, :created_at
  end

  def self.down
    drop_table :travels
  end
end
