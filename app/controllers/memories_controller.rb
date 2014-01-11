class MemoriesController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @user = current_user.id
    @memory = @question.memories.build
  end


  def create
    @question = Question.find(params[:question_id])
    @memory = current_user.memories.build(memory_params)

    if @memory.save
      @question.answered = 'Yes'
      redirect_to dashboard_index_path, notice: "Successfully added memory."
    else
      render :new, notice: 'failure'
    end
  end


private
  
  def memory_params
    params.require(:memory).permit(:body, :user_id, :question_id)
  end

end
