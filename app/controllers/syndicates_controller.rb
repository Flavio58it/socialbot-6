class SyndicatesController < ApplicationController
  before_action :require_login

  def create
    if Product.pending.empty?
      flash[:danger] = "All products already published"
    else
      ApplicationController.publish
      flash[:success] = "Successfully published"
    end
      redirect_to root_path
  end
end
