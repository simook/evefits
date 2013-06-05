class Api::ChargesController < ApplicationController
  caches_action :index

  def index
    @charges = Rails.cache.fetch("charge_category_ids", :expire => 1.day) do
     InvGroup.where(:categoryID => 8, :published => 1).all
    end

    respond_to do |format|
      format.json { render :json => @charges, :callback => params[:callback], :root => false, :each_serializer => ChargeSerializer}
    end
  end

end
