class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    $twitter.update(@tweet.contents)
    render text: "Tweet sent!"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:contents)
  end

end
