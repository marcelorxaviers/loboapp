# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "ACME"
    highrise_base_url "BLA"
    highrise_token "BLI"
    user nil
  end
end
