# frozen_string_literal: true

json.array! @blog_comments, partial: 'blog_comments/blog_comment', as: :blog_comment
