class ShipSerializer < ActiveModel::Serializer
  self.root = false
  attributes :typeID, :groupName, :typeName, :description, :mass, :volume, :capacity, :raceName, :basePrice
end
