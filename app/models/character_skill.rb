class CharacterSkill < ActiveRecord::Base
  belongs_to :character

  attr_accessible :level, :published, :skillpoints, :typeID
end
