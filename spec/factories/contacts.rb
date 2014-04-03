# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    company nil
    first_name "primeiro"
    last_name "nome"
    email "user@provider2312.com"
    company_name "umbrella corp"
    job_title "researcher"
    phone "2345678"
    website ""
  end
end
