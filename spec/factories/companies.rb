# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "ACME"
    highrise_base_url "https://personal1788.highrisehq.com"
    highrise_token "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
    user nil
  end

  factory :company2 do
    name "SAMPLE"
    highrise_base_url "https://personal1788.highrisehq.com"
    highrise_token "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    user nil
  end
end
