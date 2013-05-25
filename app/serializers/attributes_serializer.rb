class AttributesSerializer < ActiveModel::Serializer
  attributes :value, :name
  attribute :attributeTypes, :key => 'attributes'
  attribute :effects

  def value
    object.attributeValue
  end

  def name
   DgmAttributeTypes.find(object.attributeId).attributeName
  end

  def attributeTypes
    DgmAttributeTypes.find(object.attributeId)
  end

  def effects

  end
end
