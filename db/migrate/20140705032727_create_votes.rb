class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :direction # Huh, why? An integer would be tons faster.
      t.belongs_to :item
      t.belongs_to :user

      t.timestamps
    end
  end
end
