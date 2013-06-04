class CreateDefaultCharacters < ActiveRecord::Migration
  def change
    create_table :default_characters do |t|
      t.references :character
      t.references :user

      t.timestamps
    end
    add_index :default_characters, :character_id
    add_index :default_characters, :user_id
  end
end
