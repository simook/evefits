class Api::ModulesController < ApplicationController
  def index
    @modules = InvMarketGroup.where(:marketGroupID => [11,157,24,1111,9,1112])

    respond_to do |format|
      format.json { render :json => @modules, :callback => params[:callback], :root => false, :each_serializer => ModulesSerializer }
    end
  end

  def types
    @types = InvType.where(:marketGroupID => params[:id])

    respond_to do |format|
      format.json { render :json => @types, :callback => params[:callback], :root => false, :each_serializer => TypesSerializer }
    end
  end

  def show
   @attributes = InvType.find(params[:id]).Attributes

    respond_to do |format|
      format.json { render :json => @attributes, :callback => params[:callback], :root => false, :each_serializer => AttributesSerializer }
    end
  end
end