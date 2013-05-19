class Api::SkillsController < ApplicationController
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

#SELECT dgmtypeattributes.typeID,
# dgmattributetypes.attributeName,
# dgmattributetypes.attributeID,
# dgmtypeattributes.valueInt,
# dgmtypeattributes.valueFloat,
# invtypes.groupID,
# invtypes.typeName,
# invtypes.raceID,
# chrraces.raceName,
# IF (dgmtypeattributes.valueInt > '1000', invtypes_1.typeName, NULL ) AS SkillName,
# IF (dgmtypeattributes.valueFloat > '1000', invtypes_1.typeName, NULL ) AS SkillName2
#FROM dgmattributetypes
#INNER JOIN dgmtypeattributes ON dgmattributetypes.attributeID = dgmtypeattributes.attributeID
#INNER JOIN invtypes ON dgmtypeattributes.typeID = invtypes.typeID
#INNER JOIN chrraces ON invtypes.raceID = chrraces.raceID
#LEFT JOIN invtypes AS invtypes_1 ON COALESCE(dgmtypeattributes.valueInt, dgmtypeattributes.valueFloat) = invtypes_1.typeID
#LEFT JOIN invgroups ON invtypes.groupID = invgroups.groupID
#WHERE invgroups.categoryID = '6'
#AND dgmattributetypes.attributeID IN (182,183,184,277,278,279)
#AND invtypes.published =1
#AND invtypes.typeName = 'Drake'
#ORDER BY chrraces.raceName, invtypes.typeName, dgmattributetypes.attributeName;