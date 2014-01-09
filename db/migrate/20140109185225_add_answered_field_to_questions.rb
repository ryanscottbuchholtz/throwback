class AddAnsweredFieldToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :answered, :boolean
  end

  def down
    remove_column :questions, :answered
  end
end
