class FeedReference < ActiveRecord::Base
  attr_accessible :title, :url, :feed_url, :etag
end
# == Schema Information
#
# Table name: feed_references
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  feed_url   :string(255)
#  etag       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

