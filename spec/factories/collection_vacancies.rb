FactoryBot.define do
  factory :collection_vacancy do
    to_create { |instance| instance.save }

    sequence(:id)
    collection
    vacancy

    created_at { Time.now }
    updated_at { Time.now }
  end
end
