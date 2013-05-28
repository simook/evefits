class CharactersController < ApplicationController
  def index
    @characters = current_user.characters.all

    respond_to do |format|
      format.json {render :json => @characters, :root => false}
    end
  end

  def show
  end

  def update
  end

  def create
    data = JSON.parse(params[:characters])
    data.each do |char|
      char.delete "selected"
      char.delete "avatar"
      char["user_id"] = current_user.id
    end

    @characters = Character.create(data)
    respond_to do |format|
      if @characters
        format.json { render :json => {:status => 'created'}}
      else
        format.json { render :json => {:status => 'error'}}
      end
    end
  end

  def new
   @character = Character.new

   render :layout => false
  end
end
