class DropAnsweredQuestionsTable < ActiveRecord::Migration
  
  def change
    drop_table :answered_questions
  end

end
