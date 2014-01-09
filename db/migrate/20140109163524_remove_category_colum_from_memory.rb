class RemoveCategoryColumFromMemory < ActiveRecord::Migration
  def up
    remove_column :memories, :category_id
  end

  def down
    add_column :memories, :category_id, :integer
  end
  
end
