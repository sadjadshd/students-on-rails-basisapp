class UserFirstLastDefault < ActiveRecord::Migration
  def up
    User.where("first_name = ''").update_all(:first_name => "Santa")
    User.where("last_name = ''").update_all(:last_name => "Clause")
  end

  def down
  end
end
