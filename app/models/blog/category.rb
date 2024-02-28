# frozen_string_literal: true

module Blog
  class Category < ApplicationRecord
    has_many :category_posts, class_name: Blog::CategoryPost.to_s
    has_many :posts, through: :category_posts, class_name: Blog::Post.to_s

    def background_color
      super || '#293139'
    end

    def text_color
      super || '#fff'
    end
  end
end
