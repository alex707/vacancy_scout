FactoryBot.define do
  factory :employer do
    to_create { |instance| instance.save }

    sequence(:id)
    hhru_id { rand(1000) }
    name { 'компания' }
    description { 'компания-компания' }
    industry_type { 'разработка' }
    site_url { 'https://example.com' }
    area { 'Moscow' }

    created_at { Time.now }
    updated_at { Time.now }
  end
end
