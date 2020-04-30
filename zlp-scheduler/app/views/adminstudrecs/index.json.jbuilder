
json.array!(@adminstudrecs) do |user|
  json.extract! user, :id, :name, :uin, :email, :classcode, :major
  json.url user_url(user, format: :json)
end

