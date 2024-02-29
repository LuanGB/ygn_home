# frozen_string_literal: true

module Blog
  class Comment < ApplicationRecord
    belongs_to :resource, polymorphic: true
  end
end
