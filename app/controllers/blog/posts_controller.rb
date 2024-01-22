# frozen_string_literal: true

module Blog
  class PostsController < BlogController
    # GET /blog/posts or /blog/posts.json
    def index
      @blog_posts = Blog::Post.all
    end

    # GET /blog/posts/1 or /blog/posts/1.json
    def show
      @blog_post = find_resource
    end

    private

    def page_config
      super.merge(page_title: @blog_post.title)
    end

    def page_content
      super.merge(similar_articles: [Blog::Post.last])
    end
    helper_method :page_content
  end
end
