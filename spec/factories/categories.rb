FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    vertical
  end
end
