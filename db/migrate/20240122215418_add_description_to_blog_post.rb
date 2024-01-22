# frozen_string_literal: true

class AddDescriptionToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :description, :text
  end
end
