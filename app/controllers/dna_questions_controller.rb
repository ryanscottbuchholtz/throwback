class DnaQuestionsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @dna_question = @question.dna_questions.build
    @user = current_user.id
  end

  def create
   @question = Question.find(params[:question_id])
   @dna_question = current_user.dna_questions.build(dna_question_params)
    if @dna_question.save
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

private

  def dna_question_params
    params.require(:dna_question).permit(:user_id, :question_id)
  end

end

  