class AddWishlistToWish < ActiveRecord::Migration
  def change
    add_reference :wishes, :wishlist, index: true
  end
end
