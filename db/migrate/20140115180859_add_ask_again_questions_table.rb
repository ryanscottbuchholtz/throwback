class AddAskAgainQuestionsTable < ActiveRecord::Migration
  def up
    add_column :questions, :ask_again, :boolean
  end

  def down
    remove_column :questions, :ask_again
  end
  
end
