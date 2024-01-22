# frozen_string_literal: true

class AddColorsToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_categories, :background_color, :string
    add_column :blog_categories, :text_color, :string
  end
end
