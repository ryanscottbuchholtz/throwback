class ChangeUserDefault < ActiveRecord::Migration
  def change
    change_column :users, :birth_day, :integer, null: false
    change_column :users, :birth_month, :string, null: false
    change_column :users, :birth_year, :integer, null: false
  end
end
