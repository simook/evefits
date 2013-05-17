class FittingController < ApplicationController
  def index
  end

  def show
    @fitting = Fitting.find(param[:id])
  end

  def new
    @fitting = Fitting.new
  end

  def create
    @fitting = Fitting.new(params[:product])
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
