json.array!(@posts) do |post|
  json.extract! post, :discussion_id, :name, :comment
  json.url post_url(post, format: :json)
end