FactoryBot.define do
  factory :transaction do
    association :account
    date { Date.current }
    target_name { "target name" }
    amount { 10 }
  end
end
