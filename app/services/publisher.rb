class Publisher

  def initialize
    @twitter = self.twitter
    @tumblr = self.tumblr
    @facebook = self.facebook
  end

  def twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def tumblr
    Tumblr.configure do |config|
      config.consumer_key = ENV['TUMBLR_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLR_CONSUMER_SECRET']
      config.oauth_token = ENV['TUMBLR_TOKEN']
      config.oauth_token_secret = ENV['TUMBLR_TOKEN_SECRET']
    end
    Tumblr::Client.new
  end

  def facebook
    Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
  end

  def bitly
    Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_API_KEY'])
  end

  def publish
    Product.pending.each do |product|
      begin
      product.tweet_text.each do |tweet_chunk|
        @twitter.update(tweet_chunk)
      end

      rescue Twitter::Error => e
        next
      end
      @facebook.put_wall_post(product.publish_text)
      @tumblr.text("syndicater-jzeng.tumblr.com", title: product.name, body: product.publish_text)
      product.update(published: true)
    end
  end

end
