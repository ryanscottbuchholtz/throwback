class AddYearSeasonColumnsToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :year, :integer
    add_column :memories, :season, :string
  end
end
