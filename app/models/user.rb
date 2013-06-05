class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  attr_accessor :login

  attr_accessible :role_ids, :as => :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :username

  validates :username,
    :presence => true,
    :uniqueness => true,
    :allow_blank => false
  validates :password,
    :presence => true,
    :allow_blank => false,
    :confirmation => true,
    :length => {
      :minimum => 5,
      :maximum => 20,
      :too_short => "must be at least 5 characters",
      :too_long => "nice password, but it needs to be less than 20 characters"
    }

  has_many :fittings
  has_many :characters
  has_one :default_character
  has_one :character, :through => :default_character

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
