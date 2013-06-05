class Character < ActiveRecord::Base
  self.primary_key = "characterID"

  attr_accessible :apicode, :apikey, :expires, :characterName, :characterID, :corporationName, :corporationID, :accessMask

  belongs_to :user

  has_many :skills, :class_name => :CharacterSkill

  after_create :import_skills

  def import_skills
    EveCharacter::Skills.update(self)
  end
end
