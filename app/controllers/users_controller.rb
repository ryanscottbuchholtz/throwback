class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @user = current_user
  end

  def show
    @user = User.find(current_user[:id])
  end

  def update
    @user = User.new(user_params)

    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "Profile successfully updated"
    else
      render action: 'edit'
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_year, :birth_month, :birth_day)
  end

  def user_authorization
    redirect_to(root_path) unless current_user.id == params[:id]
  end

end