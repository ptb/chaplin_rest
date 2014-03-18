json.array!(@developers) do |developer|
  json.extract! developer, :id, :name
  json.url developer_url(developer, format: :json)
end
