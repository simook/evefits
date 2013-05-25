class FittingSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :ship_id, :ship

  has_many :types, :serializer => TypesSerializer

  def ship
    InvType.find(object.ship_id)
  end

end
