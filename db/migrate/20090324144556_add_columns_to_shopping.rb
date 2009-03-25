class AddColumnsToShopping < ActiveRecord::Migration
  def self.up
    add_column :shoppings, :msg, :text
    add_column :shoppings, :mail, :string
  end

  def self.down
    remove_column :shoppings, :msg
    remove_column :shoppings, :mail
  end
end
