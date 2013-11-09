json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :content, :header
  json.url comment_url(comment, format: :json)
end
