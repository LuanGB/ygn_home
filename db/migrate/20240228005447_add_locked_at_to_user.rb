# frozen_string_literal: true

class AddLockedAtToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :locked_at, :datetime
  end
end
