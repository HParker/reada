class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.uuid :user_id, index: true
      t.uuid :feed_id, index: true

      t.timestamps
    end
  end
end
