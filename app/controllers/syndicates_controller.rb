class SyndicatesController < ApplicationController
  def create
    ApplicationController.send_tweets
    flash[:notice] = "Syndicated"
    redirect_to root_path
  end
end
