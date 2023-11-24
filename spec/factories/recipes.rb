FactoryBot.define do
  factory :recipe do
    name { 'Recipe Ex1' }
    preparation_time { 1 }
    cooking_time { 1 }
    description { 'Example description' }
    public { true }
    user
  end
end
