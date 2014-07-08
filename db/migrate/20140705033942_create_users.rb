class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender, limit: 6, null: false
      t.integer :age, limit: 3, null: false
      t.string :zip, limit: 10, null: false
      t.string :email, limit: 48, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
