class ShipModule < ActiveRecord::Base
  attr_accessible :fitting_id, :invTypes_id

  belongs_to :fitting
  belongs_to :type, :foreign_key => :invTypes_id, :class_name => :InvType
end
