# frozen_string_literal: true

class BlogController < ApplicationController
  if Rails.env.production?
    http_basic_authenticate_with name: ENV.fetch('BASIC_AUTH_NAME'), password: ENV.fetch('BASIC_AUTH_PASSWORD')
  end

  private

  def resource_stylesheets
    super + ['blog']
  end

  def page_config
    super.merge(page_title: 'The YGN Blog')
  end

  def page_content
    super.merge(
      top_3_recent: Blog::Post.first(5),
      root_path: '/blog'
    )
  end
end
