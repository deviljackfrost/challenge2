FactoryBot.define do
  factory :post_image do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    user_id { 1 }
  end
end
