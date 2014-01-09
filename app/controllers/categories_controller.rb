class CategoriesController < ApplicationController
  before_action :authenticate_user, :set_category, only: [:show, :edit, :update, :destroy]

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
      redirect_to categories_path, notice: "Successfully added category."
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end


  protected

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def authenticate_user
    unless user_signed_in? and current_user.is_admin?
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end
end