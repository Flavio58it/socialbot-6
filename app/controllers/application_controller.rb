class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  class << self
    attr_accessor :twitter

    def publish
      Product.pending.each do |product|
        $twitter.update(product.tweet_text)
        $page_graph.put_wall_post(product.tweet_text)
        product.update(completed: true)
      end
    end

  end

  def require_login
    if !logged_in?
      flash[:notice] = "You must be logged in to do that"
      redirect_to root_url
    else
      redirect_to products_url
    end
  end

end
