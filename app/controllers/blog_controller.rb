# frozen_string_literal: true

class BlogController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_NAME'), password: ENV.fetch('BASIC_AUTH_PASSWORD') if Rails.env.production?

  private

  def resource_stylesheets
    ['blog']
  end

  def page_config
    super.merge(page_title: 'YGN - Blog')
  end

  def page_content
    super.merge(top_3_recent: Blog::Post.first(3))
  end
  helper_method :page_content
end
