module EveCharacter
  module Skills
    def self.update(character)
      @eve = character_sheet_eve_api(character)
      if @eve
        @eve.skills.each do |newSkill|
          existSkill = character.skills.where(:typeID => newSkill.typeID)
          if existSkill.exists?
            unless existSkill.first.skillpoints.eql?(newSkill.skillpoints) or existSkill.first.level.eql?(newSkill.level)
              existSkill.first.skillpoints = newSkill.skillpoints
              existSkill.first.level = newSkill.level
              existSkill.first.published = newSkill.published
              existSkill.first.save
            end
          else
            @skill = character.skills.new
            @skill.typeID = newSkill.typeID
            @skill.skillpoints = newSkill.skillpoints
            @skill.level = newSkill.level
            @skill.published = newSkill.published
            @skill.save
          end
        end
        return :status => 'ok'
      else
        return :status => 'error'
      end
    end

    private
    def self.character_sheet_eve_api(character)
      begin
        api = init_eve_api(character)
        api.scope = 'char'
        api.CharacterSheet(:characterID => character.characterID)
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect} Character: #{character.inspect}"
        return false
      end
    end

    def self.init_eve_api(character)
      begin
        EAAL::API.new(character.apikey,character.apicode)
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect} Character: #{character.inspect}"
        return false
      end
    end
  end
end