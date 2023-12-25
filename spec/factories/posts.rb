FactoryBot.define do
    factory :post do
      content { "Some content" }
      # make sure to define all necessary attributes
      association :user, factory: :user # assumes you have a user factory
    end
  end
  