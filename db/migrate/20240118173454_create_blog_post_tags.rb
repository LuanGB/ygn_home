class CreateBlogPostTags < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_post_tags do |t|
      t.references :post, null: false, foreign_key: { to_table: :blog_posts }
      t.references :tag, null: false, foreign_key: { to_table: :blog_tags }

      t.timestamps
    end
  end
end
