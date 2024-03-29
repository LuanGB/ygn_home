# frozen_string_literal: true

json.extract! blog_post, :id, :title, :content, :published_at, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)
