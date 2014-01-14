class MakeBirthdayRequiredUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :birth_year, :integer, null: false, default: 1976
    change_column :users, :birth_day, :integer, null: false, default: 25
    change_column :users, :birth_month, :string, null: false, default: 'September'
  end
end
