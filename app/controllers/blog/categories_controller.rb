# frozen_string_literal: true

module Blog
  class CategoriesController < BlogController
    before_action :set_blog_category, only: :show

    # GET /blog/categories or /blog/categories.json
    def index
      @blog_categories = Blog::Category.all
      add_breadcrumb('Blog', '/blog')
      add_page_config(:page_title, "Categories")
    end

    def show
      @blog_posts = @blog_category.posts.order(published_at: :desc).page(params.fetch(:page, 1)).per(10)

      add_breadcrumb('Blog', '/blog')
      add_page_config(:page_title, "\"#{params[:id]}\" Posts")

      render "blog/posts/index", layout: 'blog'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog_category
      @blog_category = Blog::Category.find_by(name: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_category_params
      params.require(:blog_category).permit(:name)
    end
  end
end
