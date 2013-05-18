class FittingController < ApplicationController
  def index
    @fittings = Fitting.all

    respond_to do |format|
      format.json {render :json => @fittings, :callback => params[:callback] }
      format.html
    end
  end

  def show
    @fitting = Fitting.find(params[:id])

    respond_to do |format|
      format.json {render :json => @fitting, :callback => params[:callback] }
      format.html
    end
  end

  def new
    @fitting = Fitting.new
  end

  def create
    debugger
    @fitting = Fitting.new(params[:fitting])
    respond_to do |format|
      if @fitting.save
        format.html { redirect_to user_fitting_index_path(current_user) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
