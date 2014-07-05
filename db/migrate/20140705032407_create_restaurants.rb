class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
