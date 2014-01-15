class Admin::QuestionsController < Admin::AdminController
  before_action :set_question, except: [:index, :new]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_path
    else
      render action: 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:question, :category_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end