class Api::ModulesController < ApplicationController
  def index
    @modules = InvMarketGroups.where(:marketGroupID => [11,157,24,1111,9,1112])

    respond_to do |format|
      format.json { render :json => @modules, :callback => params[:callback], :root => false, :each_serializer => ModuleSerializer }
    end
  end

  def types
    @types = InvTypes.where(:marketGroupID => params[:id])

    respond_to do |format|
      format.json { render :json => @types, :callback => params[:callback], :root => false, :each_serializer => TypeSerializer }
    end
  end

  def show
  end
end
