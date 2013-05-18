class Fitting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :ship_id
  has_one :ship
end
