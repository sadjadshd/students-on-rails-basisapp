json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :name, :description
  json.url wishlist_url(wishlist, format: :json)
end
