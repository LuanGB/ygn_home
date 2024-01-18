class CreateBlogAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_authors do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end
  end
end
