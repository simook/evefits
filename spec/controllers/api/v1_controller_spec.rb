require 'spec_helper'

describe Api::V1Controller do

  describe "GET 'ships'" do
    it "returns http success" do
      get 'ships'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
