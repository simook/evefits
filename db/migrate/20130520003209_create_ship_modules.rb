class CreateShipModules < ActiveRecord::Migration
  def change
    create_table :ship_modules do |t|
      t.references :fitting
      t.references :invTypes

      t.timestamps
    end
    add_index :ship_modules, :fitting_id
    add_index :ship_modules, :invTypes_id
  end
end
