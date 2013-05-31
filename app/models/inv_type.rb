#https://raw.github.com/viciousCoder/eve-online-rails/master/app/models/inv_type.rb
class InvType < ActiveRecord::Base
  self.primary_key = :typeID
  self.table_name = :invTypes

  has_many :type_attributes, :foreign_key => :typeID, :class_name => :DgmTypeAttribute
  has_and_belongs_to_many :Attributes, :join_table => :dgmTypeAttributes, :class_name => :DgmAttributeType, :foreign_key => :typeID, :association_foreign_key => :attributeID
  has_many :type_effects, :foreign_key => :typeID, :class_name => :DgmTypeEffect
  has_and_belongs_to_many :effects, :join_table => :dgmTypeEffects, :class_name => :DgmEffect, :foreign_key => :typeID, :association_foreign_key => :effectID
  belongs_to :market_group, :foreign_key => :marketGroupID, :class_name => :InvMarketGroup
  belongs_to :race, :foreign_key => :raceID, :class_name => :ChrRace
end