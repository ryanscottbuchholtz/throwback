class RemoveDefaultsUsersBirthday < ActiveRecord::Migration
  def change
    change_column_default(:users, :birth_day, nil)
    change_column_default(:users, :birth_month, nil)
    change_column_default(:users, :birth_month, nil)
  end
end
