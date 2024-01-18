# frozen_string_literal: true

module Blog
  class PostTag < ApplicationRecord
    belongs_to :post
    belongs_to :tag
  end
end
