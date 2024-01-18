# frozen_string_literal: true

module Blog
  class Author < ApplicationRecord
    has_many :author_posts, class_name: Blog::AuthorPost.to_s
    has_many :posts, through: :author_posts, class_name: Blog::Post.to_s
  end
end
