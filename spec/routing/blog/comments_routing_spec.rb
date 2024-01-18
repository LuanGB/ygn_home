require "rails_helper"

RSpec.describe Blog::CommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/blog/comments").to route_to("blog/comments#index")
    end

    it "routes to #new" do
      expect(get: "/blog/comments/new").to route_to("blog/comments#new")
    end

    it "routes to #show" do
      expect(get: "/blog/comments/1").to route_to("blog/comments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/blog/comments/1/edit").to route_to("blog/comments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/blog/comments").to route_to("blog/comments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/blog/comments/1").to route_to("blog/comments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/blog/comments/1").to route_to("blog/comments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/blog/comments/1").to route_to("blog/comments#destroy", id: "1")
    end
  end
end
