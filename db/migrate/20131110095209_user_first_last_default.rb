class UserFirstLastDefault < ActiveRecord::Migration
  def up
    User.where(first_name: nil).update_all(:first_name => "Santa")
    User.where(last_name: nil).update_all(:last_name => "Clause")
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
  end

  def down
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true
  end
end
