# frozen_string_literal: true

module Blog
  class AuthorsController < ApplicationController
    before_action :set_blog_author, only: %i[show edit update destroy]

    # GET /blog/authors or /blog/authors.json
    def index
      @blog_authors = Blog::Author.all
    end

    # GET /blog/authors/1 or /blog/authors/1.json
    def show; end

    # GET /blog/authors/new
    def new
      @blog_author = Blog::Author.new
    end

    # GET /blog/authors/1/edit
    def edit; end

    # POST /blog/authors or /blog/authors.json
    def create
      @blog_author = Blog::Author.new(blog_author_params)

      respond_to do |format|
        if @blog_author.save
          format.html { redirect_to blog_author_url(@blog_author), notice: 'Author was successfully created.' }
          format.json { render :show, status: :created, location: @blog_author }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @blog_author.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blog/authors/1 or /blog/authors/1.json
    def update
      respond_to do |format|
        if @blog_author.update(blog_author_params)
          format.html { redirect_to blog_author_url(@blog_author), notice: 'Author was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog_author }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @blog_author.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blog/authors/1 or /blog/authors/1.json
    def destroy
      @blog_author.destroy!

      respond_to do |format|
        format.html { redirect_to blog_authors_url, notice: 'Author was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

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
