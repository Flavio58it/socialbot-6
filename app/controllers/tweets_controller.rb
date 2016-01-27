require 'byebug'
class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    $twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['YOUR_ACCESS_TOKEN']
      config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
    end
    @tweet = Tweet.new(tweet_params)
    $twitter.update(@tweet.contents)
    render text: "Tweet sent!"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:contents)
  end

end
