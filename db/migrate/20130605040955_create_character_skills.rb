class CreateCharacterSkills < ActiveRecord::Migration
  def change
    create_table :character_skills do |t|
      t.references :character
      t.integer :typeID
      t.string :skillpoints
      t.string :level
      t.integer :published

      t.timestamps
    end
    add_index :character_skills, :character_id
  end
end
