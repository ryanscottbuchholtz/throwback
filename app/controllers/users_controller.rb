class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)

    if @user.update(user_params)
      redirect_to dashboard_index_path(current_user), notice: "Profile successfully updated"
    else
      render action: 'edit'
    end
  end

private

def user_params
  params.require(current_user).permit(:first_name, :last_name, :birth_year, :birth_month, :birth_day)
end



end