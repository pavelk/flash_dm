class AddRatingToTravels < ActiveRecord::Migration
  def self.up
    ActiveRecord::Base.create_ratings_table :with_rater => false
    Travel.add_ratings_columns
  end

  def self.down
    ActiveRecord::Base.drop_ratings_table
    Travel.remove_ratings_columns
  end
end
