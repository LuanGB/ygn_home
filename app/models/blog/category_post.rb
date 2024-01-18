# frozen_string_literal: true

module Blog
  class CategoryPost < ApplicationRecord
    belongs_to :category
    belongs_to :post
  end
end
