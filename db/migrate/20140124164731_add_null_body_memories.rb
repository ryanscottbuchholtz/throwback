class AddNullBodyMemories < ActiveRecord::Migration
  def change
    change_column :memories, :body, :text, null: false
  end
end
