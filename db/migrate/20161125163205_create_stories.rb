# frozen_string_literal: true
class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories, id: :uuid do |t|
      # content
      t.text :title
      t.text :content
      t.string :author

      # meta
      t.string :summary
      t.text :links
      t.string :url
      t.text :entry_id

      # timestamps
      t.datetime :updated
      t.datetime :published

      # audio data
      t.string :enclosure_url
      t.string :enclosure_length
      t.string :enclosure_type

      # itunes
      t.string :itunes_author
      t.string :itunes_image
      t.string :itunes_duration
      t.string :itunes_summary
      t.string :itunes_subtitle
      t.string :itunes_explicit

      # internal
      t.uuid :feed_id, null: false
      t.string :permalink
      t.boolean :read, default: false, null: false
      t.boolean :starred, default: false, null: false
      t.timestamps
    end
  end
end
