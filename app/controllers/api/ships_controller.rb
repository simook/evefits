class Api::ShipsController < ApplicationController
  def index
    @ships = InvTypes.find_by_sql("SELECT
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

    respond_to do |format|
      format.json { render :json => @ships, :callback => params[:callback], :each_serializer => ShipSerializer }
    end
  end

  def show
    @ship = InvTypes.find_by_sql("");
  end
end
