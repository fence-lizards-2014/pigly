class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name # Sweet, i like NULL fields in the database
      t.string :location # Sweet, i like NULL fields in the database
      t.string :latitude # Sweet, i like NULL fields in the database
      t.string :longitude # Sweet, i like NULL fields in the database
      t.timestamps
    end
  end
end
