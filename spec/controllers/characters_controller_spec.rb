require 'spec_helper'

describe CharactersController do

  describe "GET 'index'" do
    it "returns all characters for a user" do
      character = FactoryGirl.build(:character)
      get :index
      assigns(:character).should eq([character])
    end
  end

  describe "GET 'new'" do
    it "creates a new character object" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'default'" do
    it "returns the default character" do
    end
  end

  describe "POST 'set_default'" do
    context "with valid attributes" do
      it "sets the current character as the default"
      it "returns a ok status message"
    end

    context "with invalid attributes" do
      it "does not set the character as the default"
      it "returns a error status message"
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      it "saves the new characters to the database"
      it "returns a ok status message"
    end

    context "with invalid attributes" do
      it "does not save the characters to the database"
      it "returns a error status message"
    end
  end

end
