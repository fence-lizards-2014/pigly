class AddToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :address, :string
  	add_column :restaurants, :phone, :string
  	add_column :restaurants, :postal_code, :string
  	add_column :restaurants, :website, :string
  	add_column :restaurants, :locu_id, :string
  end
end