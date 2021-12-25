FactoryBot.define do
  factory :account do
    sequence(:name) { |n| "My account #{n}" }
  end
end
