class AddPriceAndLink < ActiveRecord::Migration
  def change
    add_column :wishes, :price , :integer
    add_column :wishes, :link , :string
  end
end
