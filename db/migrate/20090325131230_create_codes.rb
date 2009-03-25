class CreateCodes < ActiveRecord::Migration
  def self.up
    create_table :codes do |t|
      t.string :email
      t.string :code
    end
    add_index :codes, :code
  end

  def self.down
    drop_table :codes
  end
end
