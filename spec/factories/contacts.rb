# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    company nil
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    company_name "MyString"
    job_title "MyString"
    phone "MyString"
    website "MyString"
  end
end
