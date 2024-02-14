# frozen_string_literal: true

module Blog
  class CategoriesController < ApplicationController
    before_action :set_blog_category, only: :show

    # GET /blog/categories or /blog/categories.json
    def index
      @blog_categories = Blog::Category.all
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog_category
      @blog_category = Blog::Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_category_params
      params.require(:blog_category).permit(:name)
    end
  end
end
