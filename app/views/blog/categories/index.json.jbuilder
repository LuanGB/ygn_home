# frozen_string_literal: true

json.array! @blog_categories, partial: 'blog_categories/blog_category', as: :blog_category
