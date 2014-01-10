class DashboardController < ApplicationController
 
  def index
  end

  def random_question(category_id)
    Question.where(params[:category_id].shuffle[0])
  end


end
