json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :age, :male
  json.url contact_url(contact, format: :json)
end
