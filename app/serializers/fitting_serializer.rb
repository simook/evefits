class FittingSerializer < ActiveModel::Serializer
  self.root = false
  attributes :id, :name,:ship_id

  has_one :ship

  def ship
    InvTypes.find(ship_id)
  end
end
