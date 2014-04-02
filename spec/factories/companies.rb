# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    highrise_base_url "MyString"
    highrise_token "MyString"
    user nil
  end
end
