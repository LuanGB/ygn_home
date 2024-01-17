require "rails_helper"

RSpec.describe Blog::PostsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/posts").to route_to("blog/posts#index")
    end

    it "routes to #new" do
      expect(get: "/blog/posts/new").to route_to("blog/posts#new")
    end

    it "routes to #show" do
      expect(get: "/blog/posts/1").to route_to("blog/posts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/posts/1/edit").to route_to("blog/posts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/posts").to route_to("blog/posts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/posts/1").to route_to("blog/posts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/posts/1").to route_to("blog/posts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/posts/1").to route_to("blog/posts#destroy", id: "1")
    end
  end
end
