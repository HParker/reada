# frozen_string_literal: true

class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.uuid :user_id, index: true
      t.uuid :story_id, index: true

      t.timestamps
    end
  end
end
