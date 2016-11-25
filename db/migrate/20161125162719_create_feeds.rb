class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :url
      t.datetime :last_fetched
      t.integer :status
      t.integer :group_id

      t.timestamps
    end
  end
end
