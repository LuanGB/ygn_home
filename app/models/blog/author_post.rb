class Blog::AuthorPost < ApplicationRecord
  belongs_to :author
  belongs_to :post
end
