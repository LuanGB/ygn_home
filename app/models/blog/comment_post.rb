# frozen_string_literal: true

module Blog
  class CommentPost < ApplicationRecord
    belongs_to :comment
    belongs_to :post
  end
end
