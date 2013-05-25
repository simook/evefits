class ChrRace < ActiveRecord::Base
  self.primary_key = :raceID
  self.table_name = :chrRaces

  has_many :types, :foreign_key => :raceID, :class_name => :InvType
end