class Api::ShipsController < ApplicationController
  def index
    @ships = Rails.cache.fetch("all_ships_index", :expires_in => 1.day) do
      InvType.find_by_sql("SELECT
       t.*,
       g.groupName,
       r.raceName,
       m.marketGroupName marketGroupName,
       mp.marketGroupName marketParentGroupName
    FROM
      chrRaces AS r INNER JOIN
      invTypes AS t ON r.raceID = t.raceID INNER JOIN
      invGroups AS g ON t.groupID = g.groupID LEFT OUTER JOIN
      invMarketGroups AS m ON t.marketGroupID = m.marketGroupID LEFT JOIN
      invMarketGroups AS mp ON m.parentGroupID = mp.marketGroupID
    WHERE
      g.categoryID = 6 AND t.published = 1
    ORDER BY
      t.typeName ASC")
    end

    respond_to do |format|
      format.json { render :json => @ships, :callback => params[:callback], :each_serializer => ShipSerializer }
    end
  end

  def show
    @ship = Rails.cache.fetch("ship_#{params[:id]}", :expires_in => 1.day) do
      InvType.find_by_sql("SELECT
        attribtypes.attributename,
        coalesce(attrib.valueFloat, attrib.valueInt) as value
    FROM dgmTypeAttributes AS attrib
        INNER JOIN invTypes AS type
          ON attrib.typeID = type.typeID
        INNER JOIN dgmAttributeTypes AS attribtypes
          ON attrib.attributeID = attribtypes.attributeID
    WHERE attribtypes.attributename IN ('lowSlots', 'medSlots', 'hiSlots', 'rigSlots',
        'maxSubSystems', 'lowSlotModifier','medSlotModifier','hiSlotModifier')
    AND type.typeID = #{params[:id]};")
    end

    respond_to do |format|
      format.json { render :json => @ship, :callback => params[:callback], :root => false }
    end
  end
end
