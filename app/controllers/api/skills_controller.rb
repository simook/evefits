require 'open-uri'
require 'nokogiri'

class Api::SkillsController < ApplicationController
  def index
    @skill_tree = Rails.cache.fetch("skills_tree", :expires_in => 1.day) do
      @xml = Nokogiri::XML(open('https://api.eveonline.com/eve/SkillTree.xml.aspx'))
      Hash.from_xml(@xml.to_xml).to_json
    end

    respond_to do |format|
      format.json {render :json => @skill_tree, :callback => params[:callback], :root => false }
    end
  end

  def show
    @skills = invTypes.find_by_sql("SELECT dgmTypeAttributes.typeID,
      dgmAttributeTypes.attributeName,
      dgmAttributeTypes.attributeID,
      dgmTypeAttributes.valueInt,
      dgmTypeAttributes.valueFloat,
      invTypes.groupID,
      invTypes.typeName,
    IF (dgmTypeAttributes.valueInt > '1000', invTypes_1.typeName, NULL ) AS SkillName,
    IF (dgmTypeAttributes.valueFloat > '1000', invTypes_1.typeName, NULL ) AS SkillName2
    FROM dgmAttributeTypes
    INNER JOIN dgmTypeAttributes ON dgmAttributeTypes.attributeID = dgmTypeAttributes.attributeID
    INNER JOIN invTypes ON dgmTypeAttributes.typeID = invTypes.typeID
    LEFT JOIN invTypes AS invTypes_1 ON COALESCE(dgmTypeAttributes.valueInt, dgmTypeAttributes.valueFloat) = invTypes_1.typeID
    LEFT JOIN invgroups ON invTypes.groupID = invgroups.groupID
    WHERE invgroups.categoryID IN (7, 8, 18)
    AND dgmAttributeTypes.attributeID IN (182,183,184,277,278,279)
    AND invTypes.published = 1
    AND invTypes.typeID = #{params[:id]}
    ORDER BY invTypes.typeName, dgmAttributeTypes.attributeName")

    respond_to do |format|
      format.json { render :json => @skills, :callback => params[:callback], :root => false }
    end
  end
end