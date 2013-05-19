class TypesSerializer < ActiveModel::Serializer
  attributes :id, :typeName, :description, :mass, :volume, :capacity, :portionSize, :raceID, :basePrice, :slot

  def slot
    @slot = InvTypes.find_by_sql("SELECT TRIM(effect.effectName) AS slot
    FROM invTypes AS type
         INNER JOIN dgmTypeEffects AS typeEffect
           ON type.typeID = typeEffect.typeID
         INNER JOIN dgmEffects AS effect
           ON typeEffect.effectID = effect.effectID
    WHERE effect.effectName IN ('loPower', 'medPower', 'hiPower', 'rigSlot')
      AND type.typeID = #{id};").first

    @slot.nil? ? '' : @slot.slot
  end
end
