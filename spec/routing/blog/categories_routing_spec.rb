require "rails_helper"

RSpec.describe Blog::CategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/categories").to route_to("blog/categories#index")
    end

    it "routes to #new" do
      expect(get: "/blog/categories/new").to route_to("blog/categories#new")
    end

    it "routes to #show" do
      expect(get: "/blog/categories/1").to route_to("blog/categories#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/categories/1/edit").to route_to("blog/categories#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/categories").to route_to("blog/categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/categories/1").to route_to("blog/categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/categories/1").to route_to("blog/categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/categories/1").to route_to("blog/categories#destroy", id: "1")
    end
  end
end
