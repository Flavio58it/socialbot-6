class SyndicatesController < ApplicationController
  before_action :require_login

  def create
    ApplicationController.publish
    flash[:success] = "Successfully published"
    redirect_to root_path
  end
end
