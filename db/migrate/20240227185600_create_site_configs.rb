# frozen_string_literal: true

class CreateSiteConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :site_configs do |t|
      t.string :name
      t.boolean :active
      t.jsonb :json_attributes

      t.timestamps
    end
  end
end
