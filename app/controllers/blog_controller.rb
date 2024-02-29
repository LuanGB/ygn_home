# frozen_string_literal: true

class BlogController < ApplicationController
  if Rails.env.production?
    http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_NAME'), password: ENV.fetch('BASIC_AUTH_PASSWORD')
  end

  def index
    @blog_posts = Blog::Post.published.page(params.fetch(:page, 1)).per(10)

    if params.fetch(:page, 1) == 1
      curret_page_posts_ids = @blog_posts.map(&:id)
      @highlights = Blog::Category.all.filter_map do |c|
        posts = c.posts.left_joins(:comments).published.where.not(id: curret_page_posts_ids).order('count(blog_comments.id) DESC').group(:id).limit(3).to_a
        next unless posts.present?

        { category: c.name, posts: posts }
      end
    else
      @highlights = []
    end
  end

  private

  def resource_stylesheets
    super + ['blog']
  end

  def set_page_config
    super
    add_page_config(:page_title, 'The YGN Blog')
  end

  def set_page_content
    super
    add_page_content(:top_3_recent, Blog::Post.last(3))
  end
end
