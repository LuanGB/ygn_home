# frozen_string_literal: true

json.array! @blog_authors, partial: 'blog_authors/blog_author', as: :blog_author
