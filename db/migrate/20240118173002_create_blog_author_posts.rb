# frozen_string_literal: true

class CreateBlogAuthorPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_author_posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :blog_authors }
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }

      t.timestamps
    end
  end
end
