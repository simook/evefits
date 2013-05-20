class FittingSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name, :ship_id, :ship

  has_many :invTypes, :serializer => TypesSerializer

  def ship
    InvTypes.find(ship_id)
  end

end
