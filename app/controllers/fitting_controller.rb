class FittingController < ApplicationController
  def index
    @fittings = User.find(current_user).fittings.all

    respond_to do |format|
      format.json {render :json => @fittings, :callback => params[:callback] }
      format.html
    end
  end

  def edit
    begin
      @fitting = User.find(current_user).fittings.find(params[:id])
    rescue => e
      return redirect_to :action => 'index'
    end

    respond_to do |format|
      format.json {render :json => @fitting, :callback => params[:callback] }
      format.html
    end
  end

  def new
    @fitting = Fitting.new
  end

  def create
    data = params[:fitting]
    data[:user_id] = current_user.id

    @fitting = Fitting.new(data)
    respond_to do |format|
      if @fitting.save
        format.html { redirect_to user_fitting_index_path(current_user) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def show
  end

  def update
    method = params[:method]
    type = params[:type]
    data = Hash.new
    data[:fitting_id] = params[:id]
    data[:invTypes_id] = params[:module]
    if method === 'add'
      @module = ShipModule.new(data)
      respond_to do |format|
        if @module.save
          format.json {render :json => {:status => 'saved'}}
        else
          format.json {render :json => {:status => 'bad'}}
        end
      end
    elsif method === 'remove'
      @module = ShipModule.where(:fitting_id => data[:fitting_id], :invTypes_id => data[:invTypes_id]).first
      respond_to do |format|
        if ShipModule.delete(@module)
          format.json {render :json => {:status => 'deleted'}}
        else
          format.json {render :json => {:status => 'bad'}}
        end
      end
    end
  end

  def destroy
  end
end
