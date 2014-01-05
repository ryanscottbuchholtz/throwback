class ChangeBirthColumnToNullTrue < ActiveRecord::Migration
  def up
    change_column :users, :birth_month, :string, null: true
    change_column :users, :birth_day, :integer, null: true
    change_column :users, :birth_year, :integer, null: true
    change_column :users, :gender, :string, null: true
  end

  def down
    change_column :users, :birth_month, :string, null: false
    change_column :users, :birth_day, :integer, null: false
    change_column :users, :birth_year, :integer, null: false
    change_column :users, :gender, :string, null: false
  end
end
