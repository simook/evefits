require 'eaal'
class SkillsController < ApplicationController
  def index
    @skills = current_user.character.skills

    respond_to do |format|
      format.json {render :json => @skills, :root => false, :each_serializer => SkillsSerializer}
    end
  end

  def import
    begin
      @character = Character.find(params[:id]) || nil
    rescue => e
      return redirect_to root_path
    end

    @skills = EveCharacter::Skills.update(@character)

    respond_to do |format|
      format.json { render :json => @skills}
    end
  end
end
