class ModulesSerializer < ActiveModel::Serializer
  attributes :iconID, :marketGroupID, :marketGroupName, :parentGroupID

  has_many :groups, :serializer => ModulesSerializer

  def groups
    InvMarketGroup.where(:parentGroupID => marketGroupID)
  end
end
