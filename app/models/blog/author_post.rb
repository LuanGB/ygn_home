# frozen_string_literal: true

module Blog
  class AuthorPost < ApplicationRecord
    belongs_to :author
    belongs_to :post
  end
end
