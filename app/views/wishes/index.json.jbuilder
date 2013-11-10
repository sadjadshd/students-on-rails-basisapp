json.array!(@wishes) do |wish|
  json.extract! wish, :name, :description
  json.url wish_url(wish, format: :json)
end
