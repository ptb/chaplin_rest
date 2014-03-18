require "spec_helper"

describe DevelopersController do
  describe "routing" do

    it "routes to #index" do
      get("/developers").should route_to("developers#index")
    end

    it "routes to #new" do
      get("/developers/new").should route_to("developers#new")
    end

    it "routes to #show" do
      get("/developers/1").should route_to("developers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/developers/1/edit").should route_to("developers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/developers").should route_to("developers#create")
    end

    it "routes to #update" do
      put("/developers/1").should route_to("developers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/developers/1").should route_to("developers#destroy", :id => "1")
    end

  end
end
