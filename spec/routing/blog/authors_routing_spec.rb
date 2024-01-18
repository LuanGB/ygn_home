require "rails_helper"

RSpec.describe Blog::AuthorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/authors").to route_to("blog/authors#index")
    end

    it "routes to #new" do
      expect(get: "/blog/authors/new").to route_to("blog/authors#new")
    end

    it "routes to #show" do
      expect(get: "/blog/authors/1").to route_to("blog/authors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/authors/1/edit").to route_to("blog/authors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/authors").to route_to("blog/authors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/authors/1").to route_to("blog/authors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/authors/1").to route_to("blog/authors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/authors/1").to route_to("blog/authors#destroy", id: "1")
    end
  end
end
