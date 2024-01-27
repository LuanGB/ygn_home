# frozen_string_literal: true

module Blog
  class PostsController < BlogController
    # GET /blog/posts or /blog/posts.json
    def index
      require 'pry'; binding.pry; true
      @blog_posts = Blog::Post.published.page(params.fetch(:page, 1)).per(10)
    end

    # GET /blog/posts/1 or /blog/posts/1.json
    def show
      @blog_post = find_resource
    end

    private

    def page_config
      config = super
      config[:page_title] = @blog_post.title if @blog_post
      config
    end

    def page_content
      return @posts_page_content if @posts_page_content

      @posts_page_content = super
      if @blog_post
        scope = Blog::Post.joins(:categories).where('blog_categories.id': @blog_post.categories.map(&:id))
        @posts_page_content[:similar_articles] = scope.where.not(id: @blog_post.id).last(2)
      end
      @posts_page_content
    end
    helper_method :page_content
  end
end
