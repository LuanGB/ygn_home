# frozen_string_literal: true

class CreateBlogCommentPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_comment_posts do |t|
      t.references :comment, null: false, foreign_key: { to_table: :blog_comments }
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }

      t.timestamps
    end
  end
end
