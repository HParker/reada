# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :image_url
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end
end
