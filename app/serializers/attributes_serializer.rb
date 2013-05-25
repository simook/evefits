class AttributesSerializer < ActiveModel::Serializer
  attributes :attributeID, :attributeName, :defaultValue, :displayName, :stackable, :highIsGood, :categoryID, :description, :value

  def value
    @value = DgmAttributeType.find(object.attributeID).type_attributes.where(:typeID => url_options[:_path_segments][:id]).first
    @value.valueFloat || @value.valueInt
  end
end
