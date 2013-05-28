class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user
      t.string :characterName
      t.integer :characterID
      t.integer :corporationID
      t.string :corporationName
      t.integer :apikey
      t.string :apicode
      t.datetime :expires
      t.integer :accessMask

      t.timestamps
    end
    add_index :characters, :user_id
  end
end
