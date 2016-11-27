# frozen_string_literal: true
class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds, id: :uuid do |t|
      # identifiers
      t.string :etag
      t.string :url
      t.string :feed_url
      t.text :links

      t.string :title
      t.string :description
      t.string :language

      # itunes
      t.string :itunes_author
      t.string :itunes_image
      t.string :itunes_summary
      t.string :itunes_subtitle
      t.string :itunes_explicit
      t.string :itunes_keywords
      t.string :itunes_owners
      t.string :itunes_categories

      # internal
      t.datetime :last_fetched
      t.integer :status, default: 0, null: false
      t.integer :group_id

      t.datetime :last_modified
      t.timestamps
    end
  end
end
