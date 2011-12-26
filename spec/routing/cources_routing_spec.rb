require "spec_helper"

describe CourcesController do
  describe "routing" do

    it "routes to #index" do
      get("/cources").should route_to("cources#index")
    end

    it "routes to #new" do
      get("/cources/new").should route_to("cources#new")
    end

    it "routes to #show" do
      get("/cources/1").should route_to("cources#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cources/1/edit").should route_to("cources#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cources").should route_to("cources#create")
    end

    it "routes to #update" do
      put("/cources/1").should route_to("cources#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cources/1").should route_to("cources#destroy", :id => "1")
    end

  end
end
