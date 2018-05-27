FactoryBot.define do
  factory :album do
    title { Faker::FamilyGuy.quote }
    year 2000
    condition "mint"
  end
end
