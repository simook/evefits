class ModulesSerializer < ActiveModel::Serializer
  attributes :iconID, :marketGroupID, :marketGroupName, :parentGroupID

  has_many :groups, :serializer => ModulesSerializer

  def groups
    InvMarketGroups.where(:parentGroupID => marketGroupID)
  end
end
