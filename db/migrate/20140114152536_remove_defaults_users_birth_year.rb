class RemoveDefaultsUsersBirthYear < ActiveRecord::Migration
  def change
    change_column_default(:users, :birth_year, nil)
  end
end
