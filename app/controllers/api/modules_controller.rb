class Api::ModulesController < ApplicationController
  caches_action :index, :types

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
    @module = InvType.find(params[:id])

    respond_to do |format|
      format.json { render :json => @module, :callback => params[:callback], :root => false, :serializer => TypesSerializer }
    end
  end

  def attributes
   @attributes = InvType.find(params[:id]).Attributes.where(:published => 1)

    respond_to do |format|
      format.json { render :json => @attributes, :callback => params[:callback], :root => false, :each_serializer => AttributesSerializer }
    end
  end

  def effects
   @attributes = InvType.find(params[:id]).effects.where(:published => 1)

    respond_to do |format|
      format.json { render :json => @attributes, :callback => params[:callback], :root => false }
    end
  end
end