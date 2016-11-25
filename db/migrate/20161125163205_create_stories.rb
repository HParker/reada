class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.text :title
      t.text :permalink
      t.text :body
      t.integer :feed_id
      t.datetime :published
      t.boolean :read
      t.boolean :starred

      t.timestamps
    end
  end
end
