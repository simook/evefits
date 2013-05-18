class ModuleSerializer < ActiveModel::Serializer
  attributes :iconID, :marketGroupID, :marketGroupName, :parentGroupID

  has_many :groups, :serializer => ModuleSerializer

  def groups
    InvMarketGroups.where(:parentGroupID => marketGroupID)
  end
end
