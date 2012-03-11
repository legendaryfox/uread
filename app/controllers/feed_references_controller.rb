class FeedReferencesController < ApplicationController
  def demo_feed
    # feed_url = "http://feeds.feedburner.com/PaulDixExplainsNothing"
    feed_url = params[:feed_url]
    @feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    @entries = @feed.entries
    
  end

end
