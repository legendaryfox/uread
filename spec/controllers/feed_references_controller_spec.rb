require 'spec_helper'

describe FeedReferencesController do

  describe "GET 'demo_feed'" do
    it "should be successful" do
      get 'demo_feed'
      response.should be_success
    end
  end

end
