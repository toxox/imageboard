json.array!(@boards) do |board|
  json.extract! board, :name, :short_name
  json.url board_url(board, format: :json)
end
