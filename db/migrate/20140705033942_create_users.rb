class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender
      t.integer :age
      t.integer :zip
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
