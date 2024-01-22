# frozen_string_literal: true

module Blog
  class Author < ApplicationRecord
    has_one_attached :avatar
    include AttachmentsUrls

    has_many :author_posts, class_name: Blog::AuthorPost.to_s
    has_many :posts, through: :author_posts, class_name: Blog::Post.to_s

    validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  end
end
