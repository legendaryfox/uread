class FeedReference < ActiveRecord::Base
  attr_accessible :title, :url, :feed_url, :etag

  belongs_to :user

  validates :feed_url, :presence => true
  validates :title, :presence => true
  
  validate :valid_feed_url



  def self.get_feed_from_url(input_url)
    # Given an input_url, this function should return a valid feed URL (using feedbag)


    begin 
      # First, find the feed
      feed_url = Feedbag.find(input_url).first

      return feed_url if !feed_url.nil? # return feed if exists
    rescue URI::InvalidURIError
      # Probably don't need to log this.
      return nil
    end

  end



  def valid_feed_url

    # Feed Reference FeedURL 
    begin
      errors.add(:feed_url, "is not a valid feed URL") if !Feedbag.feed?(feed_url)
    rescue URI::InvalidURIError
      errors.add(:feed_url, "is not a valid feed URL")
    end

  end

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
#  user_id    :integer
#

