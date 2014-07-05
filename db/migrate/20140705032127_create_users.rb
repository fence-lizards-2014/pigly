class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender
      t.integer :age
      t.integer :zip
      t.string :email
      t.password :password

      t.timestamps
    end
  end
end
