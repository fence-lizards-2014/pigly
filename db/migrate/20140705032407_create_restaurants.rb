class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, limit: 48, null: false
      t.string :location, limit: 48
      t.string :address, limit: 64
      t.string :postal_code, limit: 10
      t.string :latitude, limit: 12
      t.string :longitude, limit: 12
      t.string :phone, limit: 24
      t.string :website, limit: 128
      t.string :locu_id
      t.timestamps
    end
  end
end
