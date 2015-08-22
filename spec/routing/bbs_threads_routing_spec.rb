require "rails_helper"

RSpec.describe BbsThreadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bbs_threads").to route_to("bbs_threads#index")
    end

    it "routes to #new" do
      expect(:get => "/bbs_threads/new").to route_to("bbs_threads#new")
    end

    it "routes to #show" do
      expect(:get => "/bbs_threads/1").to route_to("bbs_threads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/bbs_threads/1/edit").to route_to("bbs_threads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bbs_threads").to route_to("bbs_threads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bbs_threads/1").to route_to("bbs_threads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bbs_threads/1").to route_to("bbs_threads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bbs_threads/1").to route_to("bbs_threads#destroy", :id => "1")
    end

  end
end
