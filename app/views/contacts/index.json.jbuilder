json.array!(@contacts) do |contact|
  json.extract! contact, :id, :company_id, :first_name, :last_name, :email, :company_name, :job_title, :phone, :website
  json.url contact_url(contact, format: :json)
end
