class TypeSerializer < ActiveModel::Serializer
  attributes :id, :typeName, :description, :mass, :volume, :capacity, :portionSize, :raceID, :basePrice
end
