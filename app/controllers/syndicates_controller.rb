class SyndicatesController < ApplicationController
  def create
    ApplicationController.publish
    flash[:notice] = "Published"
    redirect_to root_path
  end
end
