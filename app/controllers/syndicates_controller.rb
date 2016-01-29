class SyndicatesController < ApplicationController
  before_action :require_login
  
  def create
    ApplicationController.publish
    flash[:notice] = "Published"
    redirect_to root_path
  end
end
