# frozen_string_literal: true

class CreateBlogCategoryPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_category_posts do |t|
      t.references :category, null: false, foreign_key: { to_table: :blog_categories }
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }

      t.timestamps
    end
  end
end
