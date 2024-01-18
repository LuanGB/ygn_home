require "rails_helper"

RSpec.describe Blog::TagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/tags").to route_to("blog/tags#index")
    end

    it "routes to #new" do
      expect(get: "/blog/tags/new").to route_to("blog/tags#new")
    end

    it "routes to #show" do
      expect(get: "/blog/tags/1").to route_to("blog/tags#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/tags/1/edit").to route_to("blog/tags#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/tags").to route_to("blog/tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/tags/1").to route_to("blog/tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/tags/1").to route_to("blog/tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/tags/1").to route_to("blog/tags#destroy", id: "1")
    end
  end
end
