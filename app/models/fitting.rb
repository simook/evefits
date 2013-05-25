class Fitting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :ship_id, :user_id

  has_many :shipModules
  has_many :types, :through => :shipModules
end
