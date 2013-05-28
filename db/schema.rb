# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130525204044) do

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.string   "characterName"
    t.integer  "characterID"
    t.integer  "corporationID"
    t.string   "corporationName"
    t.integer  "apikey"
    t.string   "apicode"
    t.datetime "expires"
    t.integer  "accessMask"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "characters", ["user_id"], :name => "index_characters_on_user_id"

  create_table "chrRaces", :primary_key => "raceID", :force => true do |t|
    t.string  "raceName",         :limit => 100
    t.string  "description",      :limit => 1000
    t.integer "iconID"
    t.string  "shortDescription", :limit => 500
  end

  create_table "dgmAttributeTypes", :primary_key => "attributeID", :force => true do |t|
    t.string  "attributeName", :limit => 100
    t.string  "description",   :limit => 1000
    t.integer "iconID"
    t.float   "defaultValue"
    t.integer "published"
    t.string  "displayName",   :limit => 100
    t.integer "unitID"
    t.integer "stackable"
    t.integer "highIsGood"
    t.integer "categoryID"
  end

  create_table "dgmEffects", :primary_key => "effectID", :force => true do |t|
    t.string  "effectName",                     :limit => 400
    t.integer "effectCategory",                 :limit => 2
    t.integer "preExpression"
    t.integer "postExpression"
    t.string  "description",                    :limit => 1000
    t.string  "guid",                           :limit => 60
    t.integer "iconID"
    t.integer "isOffensive"
    t.integer "isAssistance"
    t.integer "durationAttributeID",            :limit => 2
    t.integer "trackingSpeedAttributeID",       :limit => 2
    t.integer "dischargeAttributeID",           :limit => 2
    t.integer "rangeAttributeID",               :limit => 2
    t.integer "falloffAttributeID",             :limit => 2
    t.integer "disallowAutoRepeat"
    t.integer "published"
    t.string  "displayName",                    :limit => 100
    t.integer "isWarpSafe"
    t.integer "rangeChance"
    t.integer "electronicChance"
    t.integer "propulsionChance"
    t.integer "distribution"
    t.string  "sfxName",                        :limit => 20
    t.integer "npcUsageChanceAttributeID",      :limit => 2
    t.integer "npcActivationChanceAttributeID", :limit => 2
    t.integer "fittingUsageChanceAttributeID",  :limit => 2
  end

  create_table "dgmTypeAttributes", :id => false, :force => true do |t|
    t.integer "typeID",                   :null => false
    t.integer "attributeID", :limit => 2, :null => false
    t.integer "valueInt"
    t.float   "valueFloat"
  end

  create_table "dgmTypeEffects", :id => false, :force => true do |t|
    t.integer "typeID",                 :null => false
    t.integer "effectID",  :limit => 2, :null => false
    t.integer "isDefault"
  end

  create_table "fittings", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "ship_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "fittings", ["user_id"], :name => "index_fittings_on_user_id"

  create_table "invGroups", :primary_key => "groupID", :force => true do |t|
    t.integer "categoryID"
    t.string  "groupName",            :limit => 100
    t.string  "description",          :limit => 3000
    t.integer "iconID"
    t.integer "useBasePrice"
    t.integer "allowManufacture"
    t.integer "allowRecycler"
    t.integer "anchored"
    t.integer "anchorable"
    t.integer "fittableNonSingleton"
    t.integer "published"
  end

  add_index "invgroups", ["categoryID"], :name => "invGroups_IX_category"

  create_table "invMarketGroups", :primary_key => "marketGroupID", :force => true do |t|
    t.integer "parentGroupID"
    t.string  "marketGroupName", :limit => 100
    t.string  "description",     :limit => 3000
    t.integer "iconID"
    t.integer "hasTypes"
  end

  create_table "invTypes", :primary_key => "typeID", :force => true do |t|
    t.integer "groupID"
    t.string  "typeName",            :limit => 100
    t.string  "description",         :limit => 3000
    t.float   "mass"
    t.float   "volume"
    t.float   "capacity"
    t.integer "portionSize"
    t.integer "raceID"
    t.decimal "basePrice",                           :precision => 19, :scale => 4
    t.integer "published"
    t.integer "marketGroupID"
    t.float   "chanceOfDuplicating"
  end

  add_index "invtypes", ["groupID"], :name => "invTypes_IX_Group"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "ship_modules", :force => true do |t|
    t.integer  "fitting_id"
    t.integer  "invTypes_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ship_modules", ["fitting_id"], :name => "index_ship_modules_on_fitting_id"
  add_index "ship_modules", ["invTypes_id"], :name => "index_ship_modules_on_invTypes_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
