class Character < ActiveRecord::Base
  self.primary_key = "characterID"
  attr_accessible :apicode, :apikey, :expires, :characterName, :characterID, :corporationName, :corporationID, :accessMask, :user_id

  belongs_to :user
end
