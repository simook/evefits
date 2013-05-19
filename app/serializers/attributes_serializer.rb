class AttributesSerializer < ActiveModel::Serializer
  attributes :value, :name
  attribute :attributeTypes, :key => 'attributes'

  def value
    object.attributeValue
  end

  def name
   DgmAttributeTypes.find(object.attributeId).attributeName
  end

  def attributeTypes
    DgmAttributeTypes.find(object.attributeId)
  end
end
