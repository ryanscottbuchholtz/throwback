class RemoveQuestionColumnFromMemory < ActiveRecord::Migration
  def up
    remove_column :memories, :question
  end

  def down
    add_column :memories, :question, :text
  end

end
