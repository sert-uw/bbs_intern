json.array!(@responses) do |response|
  json.extract! response, :id, :name, :address, :body, :password
  json.url response_url(response, format: :json)
end
