json.array!(@companies) do |company|
  json.extract! company, :id, :name, :highrise_base_url, :highrise_token, :user_id
  json.url company_url(company, format: :json)
end
