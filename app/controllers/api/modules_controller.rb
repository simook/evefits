class Api::ModulesController < ApplicationController

  def index
    @modules = Rails.cache.fetch("modules_index", :expires_in => 1.day) do
      InvMarketGroup.where(:marketGroupID => [11,157,24,1111,9,1112]).all
    end

    respond_to do |format|
      format.json { render :json => @modules, :callback => params[:callback], :root => false, :each_serializer => ModulesSerializer }
    end
  end

  def types
    @types = Rails.cache.fetch("module_types_group_#{params[:id]}", :expires_in => 1.hour) do
      InvType.where(:marketGroupID => params[:id]).all
    end

    respond_to do |format|
      format.json { render :json => @types, :callback => params[:callback], :root => false, :each_serializer => TypesSerializer }
    end
  end

  def show
    @module = Rails.cache.fetch("module_type_#{params[:id]}", :expires_in => 1.hour) do
      InvType.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @module, :callback => params[:callback], :root => false, :serializer => TypesSerializer }
    end
  end

  def attributes
    @attributes = Rails.cache.fetch("module_type_#{params[:id]}_attributes", :expires_in => 1.hour) do
      InvType.find(params[:id]).Attributes.where(:published => 1).all
    end

    respond_to do |format|
      format.json { render :json => @attributes, :callback => params[:callback], :root => false, :each_serializer => AttributesSerializer }
    end
  end

  def effects
    @effects = Rails.cache.fetch("module_type_effects_#{params[:id]}", :expires_in => 1.hour) do
      InvType.find(params[:id]).effects.where(:published => 1)
    end

    respond_to do |format|
      format.json { render :json => @effects, :callback => params[:callback], :root => false }
    end
  end
end