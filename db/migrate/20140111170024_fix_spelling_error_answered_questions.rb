class FixSpellingErrorAnsweredQuestions < ActiveRecord::Migration
  def change
    rename_column :answered_questions, :quesiton_id, :question_id
  end
end
