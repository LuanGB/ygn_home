# frozen_string_literal: true

module Blog
  class AuthorsController < ApplicationController
    before_action :set_blog_author, only: :show

    # GET /blog/authors or /blog/authors.json
    def index
      @blog_authors = Blog::Author.all
    end

    # GET /blog/authors/1 or /blog/authors/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog_author
      @blog_author = Blog::Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_author_params
      params.require(:blog_author).permit(:name, :bio)
    end
  end
end
