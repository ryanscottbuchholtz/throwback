class MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_memory, only: [:destroy, :show, :update, :edit]
  has_scope :year
  has_scope :quesion
  has_scope :season

  def index
    @memories = apply_scopes(current_user.memories).paginate(:page => params[:page], :per_page => 3)
    # sorted_year = @memories.sort_by &:year
    # sorted_category = @memories.sort_by &:category
  end

  def new
    @question = Question.find(params[:question_id])
    @user = current_user.id
    @memory = @question.memories.build
  end

  def show
  end

  def edit
  end

  def update
    if @memory.update(memory_params)
      redirect_to memories_path
    else
      render action: 'edit'
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @memory = current_user.memories.build(memory_params)

    if @memory.save
      redirect_to dashboard_index_path, notice: "Successfully added memory."
    else
      render :new, notice: 'failure'
    end
  end

  def destroy
    @memory.destroy
    redirect_to memories_path
  end

private
  
  def memory_params
    params.require(:memory).permit(:body, :user_id, :question_id, :year, :season)
  end

  def set_memory
    @memory = Memory.find(params[:id])
  end

end
