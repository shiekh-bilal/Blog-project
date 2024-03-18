FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'123456'}
    reset_password_token {'454331'}
  end
end
