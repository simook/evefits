class CreateFittings < ActiveRecord::Migration
  def change
    create_table :fittings do |t|
      t.string :name
      t.references :user
      t.references :ship
      t.timestamps
    end
    add_index :fittings, :user_id
  end
end
