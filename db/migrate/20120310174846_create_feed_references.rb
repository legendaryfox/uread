class CreateFeedReferences < ActiveRecord::Migration
  def change
    create_table :feed_references do |t|
      t.string :title
      t.string :url
      t.string :feed_url
      t.string :etag

      t.timestamps
    end
  end
end
