FactoryBot.define do
  factory :artist do
    name { Faker::Kpop.ii_groups }
  end
end
