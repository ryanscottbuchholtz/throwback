class AddBirthdateAndGenderToUsers < ActiveRecord::Migration
  def up
    add_column :users, :birth_month, :string, null: false
    add_column :users, :birth_day, :integer, null: false
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :gender, :string, null: false
  end

  def down
    remove_column :users, :birth_month
    remove_column :users, :birth_day
    remove_column :users, :birth_year
    remove_column :users, :gender
  end

end
