class ChangePriceDatatype < ActiveRecord::Migration
  def change
    change_column :wishes, :price, :decimal
  end
end
