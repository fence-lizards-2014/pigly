class AddFacebook < ActiveRecord::Migration
  def change
  	add_column :users, :facebook_id, :string
  	add_column :users, :facebook_photo_url, :string
  end
end
