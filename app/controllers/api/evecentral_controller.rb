require 'open-uri'
require 'nokogiri'

class Api::EvecentralController < ApplicationController
  def marketstat
    data = Nokogiri::XML(open('http://api.eve-central.com/api/marketstat?typeid='+params[:id]))
    respond_to do |format|
      format.json {render :json => Hash.from_xml(data.xpath('//type').to_xml).to_json }
    end
  end
end