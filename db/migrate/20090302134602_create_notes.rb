class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
