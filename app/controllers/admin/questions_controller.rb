class Admin::QuestionsController < Admin::AdminController
  before_action :set_question, except: [:index, :new, :create]

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

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to admin_questions_path, notice: "Successfully added question."
    else
      render :new, notice: 'failure'
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question, :category_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end