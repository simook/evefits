class ShipModule < ActiveRecord::Base
  attr_accessible :fitting_id, :invTypes_id

  belongs_to :fitting
  belongs_to :invTypes
end
