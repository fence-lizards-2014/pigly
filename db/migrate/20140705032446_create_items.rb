class CreateItems < ActiveRecord::Migration
    def change
    create_table :items do |t|
      t.belongs_to :restaurant
      t.string :name, null: false

      t.timestamps
    end
  end
end
