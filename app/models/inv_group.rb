class InvGroup < ActiveRecord::Base
  self.primary_key = :groupID
  self.table_name = :InvGroups

  has_many :types, :foreign_key => :groupID, :class_name => :InvType
end