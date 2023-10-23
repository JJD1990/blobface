FactoryBot.define do
    factory :user do
      username { "John Doe" }
      email { "john@example.com" }
      password { "password" }
    end
  end
  