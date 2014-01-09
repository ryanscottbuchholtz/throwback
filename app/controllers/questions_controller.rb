class QuestionsController < ApplicationController
  before_action :authenticate_user, :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def random_show
    @random_question = Question.where(params[:category_id].shuffle[0])
  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: "Successfully added question."
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end


  protected

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :category_id)
  end

  def authenticate_user
    unless user_signed_in? and current_user.is_admin?
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end
end