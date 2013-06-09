class ShipModuleCharges < ActiveRecord::Migration
  def up
    add_column :ship_modules, :chargeTypes_id, :integer
    add_index :ship_modules, :chargeTypes_id
  end
end
