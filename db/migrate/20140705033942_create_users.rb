class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gender              # ALL OF THESE FIELDS CAN BE NULL
      t.integer :age                # ALL OF THESE FIELDS CAN BE NULL - constraints people.
      t.string :zip                 # ALL OF THESE FIELDS CAN BE NULL
      t.string :email               # ALL OF THESE FIELDS CAN BE NULL
      t.string :password_digest     # ALL OF THESE FIELDS CAN BE NULL

      t.timestamps
    end
  end
end
