# frozen_string_literal: true
class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations, id: :uuid do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.uuid :user_id, null: false, index: true

      t.timestamps
    end
  end
end
