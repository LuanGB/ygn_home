class AddResourceIdAndResourceTypeToBlogComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :blog_comments, :resource, polymorphic: true, null: false
  end
end
