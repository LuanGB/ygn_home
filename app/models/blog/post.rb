# frozen_string_literal: true

module Blog
  class Post < ApplicationRecord
    has_one_attached :cover
    has_one_attached :thumbnail

    has_many :author_posts, class_name: Blog::AuthorPost.to_s, dependent: :destroy
    has_many :authors, through: :author_posts, class_name: Blog::Author.to_s

    has_many :category_posts, class_name: Blog::CategoryPost.to_s, dependent: :destroy
    has_many :categories, through: :category_posts, class_name: Blog::Category.to_s

    has_many :post_tags, class_name: Blog::PostTag.to_s, dependent: :destroy
    has_many :tags, through: :post_tags, class_name: Blog::Tag.to_s

    has_many :comments_posts, class_name: Blog::CommentPost.to_s, dependent: :destroy
    has_many :comments, through: :comments_posts, class_name: Blog::Comment.to_s

    has_many :urids, inverse_of: :resource, dependent: :destroy

    def html_safe_content
      content&.html_safe
    end
  end
end