class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.string :direction, limit: 4
      t.belongs_to :item
      t.belongs_to :user

      t.timestamps
    end
  end
end