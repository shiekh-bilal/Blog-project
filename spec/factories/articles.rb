FactoryBot.define do
  factory :article do
    title {Faker::Book.title}
    body {Faker::Lorem.sentence}
    status {'public'}
    user_id {2}
  end
end
