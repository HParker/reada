# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name, null: false

      t.uuid :user_id, index: true
      t.uuid :feed_id, index: true
      t.timestamps
    end
  end
end
