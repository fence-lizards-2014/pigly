class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :menu_item
      t.belongs_to :user
    end
  end
end
