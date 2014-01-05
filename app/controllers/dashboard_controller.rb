class DashboardController < ApplicationController
 
  def index
  end

  def edit
    @user = User.find(params[:user_id])
  end

end
