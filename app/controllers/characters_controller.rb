class CharactersController < ApplicationController
  def index
    @characters = current_user.characters.all

    respond_to do |format|
      format.json {render :json => @characters, :root => false}
    end
  end

  def new
   @character = Character.new
  end

  def show
  end

  def default
    @character = current_user.character || {}

    respond_to do |format|
      format.json {render :json => @character}
    end
  end

  def set_default
    @character = DefaultCharacter.new
    @character.character_id = params[:id]
    @character.user_id = current_user.id

    respond_to do |format|
      if @character.save
        format.json { render :json => {:status => 'ok'}}
      else
        format.json { render :json => {:status => 'error'}}
      end
    end
  end

  def create
    data = JSON.parse(params[:characters])
    data.each do |char|
      char.delete "selected"
      char.delete "avatar"
      char.delete "defaultCharacter"
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
end
