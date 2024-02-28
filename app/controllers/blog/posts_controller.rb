# frozen_string_literal: true

module Blog
  class PostsController < BlogController
    # GET /blog/posts or /blog/posts.json
    def index
      @blog_posts = if params[:search].present?
                      add_breadcrumb('Blog', '/blog')
                      add_page_config(:page_title, "# Search results for: \"#{params[:search]}\"")
                      Blog::Post.published.where('title like :search_term or content like :search_term', search_term: "%#{params[:search]}%").page(params.fetch(:page, 1)).per(10)
                    else
                      Blog::Post.published.page(params.fetch(:page, 1)).per(10)
                    end
    end

    # GET /blog/posts/1 or /blog/posts/1.json
    def show
      @blog_post = find_resource
      add_breadcrumb('Blog', '/blog')
      add_page_config(:page_title, @blog_post.title)
      set_similar_articles
    end

    private

    def set_similar_articles
      scope = Blog::Post.joins(:categories).where('blog_categories.id': @blog_post.categories.map(&:id))
      add_page_content(:similar_articles, scope.where.not(id: @blog_post.id).last(2))
    end
  end
end
