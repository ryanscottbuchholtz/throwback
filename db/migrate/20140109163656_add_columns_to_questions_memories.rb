class AddColumnsToQuestionsMemories < ActiveRecord::Migration
  def up
    add_column :questions, :category_id, :integer, null: false
    add_column :memories, :user_id, :integer, null: false
    add_column :memories, :question_id, :integer, null: false
  end

  def down
    remove_column :questions, :category_id
    remove_column :memories, :user_id
    remove_column :memories, :question_id
  end
  
end
