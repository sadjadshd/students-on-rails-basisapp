class Dbfix < ActiveRecord::Migration
  def change
    User.where("first_name = ''").update_all(:first_name => "Santa")
    User.where("last_name = ''").update_all(:last_name => "Clause")
  end
end
