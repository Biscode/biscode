json.array!(@users) do |user|
  json.extract! user, :id, :[Name, :About
  json.url user_url(user, format: :json)
end
