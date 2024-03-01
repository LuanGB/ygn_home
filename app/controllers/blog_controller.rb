# frozen_string_literal: true

class BlogController < ApplicationController
  if ENV.fetch('BASIC_AUTH_NAME', nil) && ENV.fetch('BASIC_AUTH_PASSWORD', nil)
    http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_NAME', nil), password: ENV.fetch('BASIC_AUTH_PASSWORD', nil)
  end

  def index
    @blog_posts = Blog::Post.published.page(params.fetch(:page, 1)).per(10)

    if params.fetch(:page, 1) == 1
      curret_page_posts_ids = @blog_posts.map(&:id)
      @highlights = Blog::Category.left_joins(:posts).order('max(blog_posts.published_at
      ) DESC NULLS LAST').group(:id).first(6).filter_map do |c|
        posts = c.posts.left_joins(:comments).published.where.not(id: curret_page_posts_ids).order('count(blog_comments.id) DESC').order(published_at: :desc).group(:id).first(3).to_a
        next unless posts.present?

        { category: c, posts: posts }
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
