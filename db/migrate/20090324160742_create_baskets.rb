class CreateBaskets < ActiveRecord::Migration
  def self.up
    create_table :baskets do |t|
        t.integer :shopping_id
        t.integer :product_id
        t.string :quantity
      end
      add_index :baskets, :shopping_id
      add_index :baskets, :product_id
  end

  def self.down
    drop_table :baskets
  end
end
