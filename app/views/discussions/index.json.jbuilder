json.array!(@discussions) do |discussion|
  json.extract! discussion, :name, :subject, :comment
  json.url discussion_url(discussion, format: :json)
end