class DefaultCharacter < ActiveRecord::Base
  attr_accessible :character_id, :user_id

  belongs_to :character
  belongs_to :user

  before_create :unique_character

  private
  def unique_character
    DefaultCharacter.destroy_all "user_id = #{self.user_id}"
  end
end
