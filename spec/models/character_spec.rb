require 'spec_helper'

describe Character do

  it "has a valid factory" do
    FactoryGirl.build(:character).should be_valid
  end

  it "should have skills after being created" do
    character = FactoryGirl.create(:character)
    expect(character.skills).to_not be_nil
  end

end
