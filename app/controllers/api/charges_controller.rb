class Api::ChargesController < ApplicationController
  caches_action :index

  def index
    @charges = InvGroup.where(:categoryID => 8, :published => 1)

    respond_to do |format|
      format.json { render :json => @charges, :callback => params[:callback], :root => false, :each_serializer => ChargeSerializer}
    end
  end

end
