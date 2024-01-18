# frozen_string_literal: true

json.array! @blog_tags, partial: 'blog_tags/blog_tag', as: :blog_tag
