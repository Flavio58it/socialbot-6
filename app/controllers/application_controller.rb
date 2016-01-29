class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  class << self
    attr_accessor :twitter

    def publish
      Product.pending.each do |product|
        product.tweet_text.each do |tweet_chunk|
          $twitter.update(tweet_chunk[0..-2])
        end
        $page_graph.put_wall_post(product.publish_text)
        $tumblr.text("syndicater-jzeng.tumblr.com", title: product.name, body: product.publish_text)
        product.update(published: true)
      end
    end

  end

  def require_login
    if !logged_in?
      flash[:danger] = "You must be logged in to do that"
      redirect_to root_url
    end
  end

  def redirect_logged_in
    redirect_to products_url if logged_in?
  end

end
