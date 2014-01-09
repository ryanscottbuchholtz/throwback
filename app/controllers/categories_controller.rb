class CategoriesController < ApplicationController
  before_action :authenticate_user

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Successfully added category."
    else
      render :new
    end
  end


  protected

  def category_params
    params.require(:category).permit(:name)
  end

  def authenticate_user
    unless user_signed_in? and current_user_is_admin?
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end
end