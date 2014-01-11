class QuestionsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @question = Question.where(category_id: @category.id).sample
  end

  def show
    @question = Question.find(params[:id])
  end

 end