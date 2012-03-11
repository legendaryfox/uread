class AddUserIdToFeedReferences < ActiveRecord::Migration
  def change
    add_column :feed_references, :user_id, :integer
  end
end
