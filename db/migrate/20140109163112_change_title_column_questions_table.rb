class ChangeTitleColumnQuestionsTable < ActiveRecord::Migration
  def up
    rename_column :questions, :title, :question
  end

  def down
    rename_column :questions, :question, :title
  end

end
