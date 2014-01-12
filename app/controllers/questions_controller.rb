class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @category = Category.find(params[:category_id])
    @question = Question.where(category_id: @category.id).where("id NOT IN(select question_id from memories where user_id = ?)", current_user.id).sample
  end

  def show
    @question = Question.find(params[:id])
  end

end