# frozen_string_literal: true

module Blog
  class PostsController < BlogController
    # GET /blog/posts or /blog/posts.json
    def index
      scope = Blog::Post.published
      scope = scope.where('title like :search_term or content like :search_term', search_term: "%#{params[:search]}%") if params[:search].present?
      scope = scope.joins(:categories).where('blog_categories.name' => params[:categories].map(&:upcase)) if params[:categories].present?
      scope = scope.joins(:tags).where('blog_tags.name' => params[:tags].map(&:downcase)) if params[:tags].present?
      @blog_posts = scope.order(published_at: :desc).page(params.fetch(:page, 1)).per(10)

      if params[:search].present? || params[:categories].present? || params[:tags].present?
        add_breadcrumb('Blog', '/blog')
        add_page_config(:page_title, "# Posts for #{params[:tags].join(' & ')}") if params[:tags].present?
        add_page_config(:page_title, "# Posts for #{params[:categories].join(' & ')}") if params[:categories].present?
        add_page_config(:page_title, "# Search results for: \"#{params[:search]}\"") if params[:search].present?
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
