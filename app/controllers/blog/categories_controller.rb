# frozen_string_literal: true

module Blog
  class CategoriesController < ApplicationController
    before_action :set_blog_category, only: %i[show edit update destroy]

    # GET /blog/categories or /blog/categories.json
    def index
      @blog_categories = Blog::Category.all
    end

    # GET /blog/categories/1 or /blog/categories/1.json
    def show; end

    # GET /blog/categories/new
    def new
      @blog_category = Blog::Category.new
    end

    # GET /blog/categories/1/edit
    def edit; end

    # POST /blog/categories or /blog/categories.json
    def create
      @blog_category = Blog::Category.new(blog_category_params)

      respond_to do |format|
        if @blog_category.save
          format.html { redirect_to blog_category_url(@blog_category), notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @blog_category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blog/categories/1 or /blog/categories/1.json
    def update
      respond_to do |format|
        if @blog_category.update(blog_category_params)
          format.html { redirect_to blog_category_url(@blog_category), notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog_category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blog/categories/1 or /blog/categories/1.json
    def destroy
      @blog_category.destroy!

      respond_to do |format|
        format.html { redirect_to blog_categories_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
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
