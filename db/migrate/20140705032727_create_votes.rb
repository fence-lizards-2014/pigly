class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.string :direction
      t.belongs_to :menu_item
      t.belongs_to :user

      t.timestamps
    end
  end
end