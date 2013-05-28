require 'eaal'

class Api::EaalController < ApplicationController
  def verify
    data = Hash.new
    data[:id] = params[:id]
    data[:code] = params[:code]

    respond_to do |format|
      format.json {render :json => verify_api(data)}
    end
  end

  protected
  def verify_api(data)
    response = Hash.new
    @api = EAAL::API.new(data[:id], data[:code] )

    begin
      response[:key] = @api.apikeyinfo.key.attribs
      response[:characters] = @api.apikeyinfo.key.characters
      response[:status] = 'ok'
    rescue EAAL::Exception.EveAPIException
      response[:status] = 'bad'
    end
    response
  end
end
