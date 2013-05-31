class InvGroup < ActiveRecord::Base
  self.primary_key = :groupID
  self.table_name = :invGroups

  has_many :types, :foreign_key => :groupID, :class_name => :InvType
end