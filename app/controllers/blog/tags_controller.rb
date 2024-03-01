# frozen_string_literal: true

module Blog
  class TagsController < BlogController
    before_action :set_blog_tag, only: :show

    # GET /blog/tags or /blog/tags.json
    def index
      @blog_tags = Blog::Tag.all
      add_breadcrumb('Blog', '/blog')
      add_page_config(:page_title, "Tags")
    end

    # GET /blog/tags/tag_name or /blog/tags/tag_name.json
    def show
      @blog_posts = @blog_tag.posts.order(published_at: :desc).page(params.fetch(:page, 1)).per(10)

      add_breadcrumb('Blog', '/blog')
      add_page_config(:page_title, "Posts tagged with \"#{params[:id]}\"")

      render "blog/posts/index", layout: 'blog'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog_tag
      @blog_tag = Blog::Tag.find_by(name: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_tag_params
      params.require(:blog_tag).permit(:name)
    end
  end
end
