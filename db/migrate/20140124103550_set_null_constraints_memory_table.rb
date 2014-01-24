class SetNullConstraintsMemoryTable < ActiveRecord::Migration
  def up
    change_column :memories, :season, :string, null: false
    change_column :memories, :year, :integer, null: false
  end

  def down
    change_column :memories, :season, :string
    change_column :memories, :year, :integer
  end

end
