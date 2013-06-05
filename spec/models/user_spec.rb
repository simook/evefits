require 'spec_helper'

describe User do
  it "has a valid FactoryGirl" do
    FactoryGirl.create(:user).should be_valid
  end

  it "should require a username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end

  it "should accept valid email addresses" do
    FactoryGirl.build(:user, username: Faker::Internet.email).should be_valid
  end

  it "should reject duplicate usernames" do
    user = FactoryGirl.create(:user)
    FactoryGirl.build(:user, username: user.username).should_not be_valid
  end

  describe "passwords" do
    it "should have a password attribute" do
      FactoryGirl.build(:user).should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      FactoryGirl.build(:user).should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do
    it "should require a password" do
      FactoryGirl.build(:user, password: nil).should_not be_valid
    end

    it "should require a matching password confirmation" do
      FactoryGirl.build(:user, password_confirmation: "invalid").should_not be_valid
    end

    it "should be at least 5 characters" do
      FactoryGirl.build(:user, password: '1234').should_not be_valid
    end

    it "should not be more than 20 characters" do
      FactoryGirl.build(:user, password: '123456789012345678901').should_not be_valid
    end
  end

  describe "password encryption" do
    it "should have an encrypted password attribute" do
      FactoryGirl.build(:user).should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      FactoryGirl.build(:user).encrypted_password.should_not be_blank
    end
  end

end
