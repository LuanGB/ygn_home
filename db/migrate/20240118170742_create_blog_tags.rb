# frozen_string_literal: true

class CreateBlogTags < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
