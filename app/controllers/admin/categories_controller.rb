class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, except: [:index, :new, :create]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: "Successfully added category."
    else
      render :new, notice: 'failure'
    end
  end


  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end