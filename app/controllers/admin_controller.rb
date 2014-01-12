class AdminController < ActionController::Base
  before_action :authenticate_user
  
  def index
  end

  def authenticate_user
    unless user_signed_in? and current_user.is_admin?
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end

end