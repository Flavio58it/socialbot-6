class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  class << self
    attr_accessor :twitter

    def send_tweets
      Product.pending.each do |product|
        $twitter.update(product.tweet_text)
        product.update(completed: true)
      end
    end

  end
end
