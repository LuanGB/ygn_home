class CreateUrids < ActiveRecord::Migration[7.1]
  def change
    create_table :urids do |t|
      t.references :resource, polymorphic: true, null: false
      t.string :slug
      t.uuid :uid

      t.timestamps
    end
  end
end
