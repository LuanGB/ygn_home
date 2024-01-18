class CreateBlogComments < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_comments do |t|
      t.string :date
      t.string :content

      t.timestamps
    end
  end
end
