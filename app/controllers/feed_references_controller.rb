class FeedReferencesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :my]
  
  def demo
    # feed_url = "http://feeds.feedburner.com/PaulDixExplainsNothing"
    
    input_url = params[:input_url]
    
    if input_url.nil?
      # No input URL.
      puts "no input url"
      
    else
      # Input URL specified
      feed_url = FeedReference.get_feed_from_url(input_url)
      puts "feed url was #{feed_url}"
    
      if !feed_url.nil? 
        # We got a valid feed - time to fetch it
        @feed = Feedzirra::Feed.fetch_and_parse(feed_url)
        @entries = @feed.entries
        puts "we have a valid feed"
      else
        # Invalid feed - display error
        puts "invalid feed"
      
      end
    end
  end
  
  
  def new
    @feed_reference = FeedReference.new 
    @feed_reference = FeedReference.new(params[:feed_reference]) # use this to auto-pass in feed URLS
    
  end
  
  def my
    @feed_references = current_user.feed_references
  end
  
  def create
    @feed_reference = current_user.feed_references.build(params[:feed_reference])
    if @feed_reference.save
      redirect_to my_feed_references_path, :flash => { :success => "Added Feed Reference! Horray!"}
    else
      render new_feed_reference_path
    end
    
  end

end
