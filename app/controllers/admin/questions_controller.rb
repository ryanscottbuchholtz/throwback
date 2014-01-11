class Admin::QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
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