class Api::ModulesController < ApplicationController
  def index
    @modules = InvMarketGroups.where(:marketGroupID => [11,157,24,1111,9,1112])

    respond_to do |format|
      format.json { render :json => @modules, :callback => params[:callback], :root => false, :each_serializer => ModulesSerializer }
    end
  end

  def types
    @types = InvTypes.where(:marketGroupID => params[:id])

    respond_to do |format|
      format.json { render :json => @types, :callback => params[:callback], :root => false, :each_serializer => TypesSerializer }
    end
  end

  def show
   @type = InvTypes.find_by_sql("
    SELECT
      coalesce(valueFloat,valueInt) AS attributeValue,
      attributeID AS attributeId
    FROM invTypes AS t1
    INNER JOIN dgmTypeAttributes AS t2 ON t1.typeID = t2.typeID
    WHERE t1.typeID = #{params[:id]} AND t1.published = 1")

    respond_to do |format|
      format.json { render :json => @type, :callback => params[:callback], :root => false, :each_serializer => AttributesSerializer }
    end
  end
end