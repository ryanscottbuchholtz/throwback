class ChangeTopicTableName < ActiveRecord::Migration
  def up
    rename_table :topics, :questions
  end

  def down
    rename_table :questions, :topics
  end
  
end
