# frozen_string_literal: true

module Blog
  class Category < ApplicationRecord
    def background_color
      super || '#293139'
    end

    def text_color
      super || '#fff'
    end
  end
end
