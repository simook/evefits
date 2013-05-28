class Character < ActiveRecord::Base
  attr_accessible :apicode, :apikey, :expires, :characterName, :characterID, :corporationName, :corporationID, :accessMask, :user_id

  belongs_to :user
end
