FactoryBot.define do
  factory :collection do
    to_create { |instance| instance.save }

    sequence(:id)
    name { 'ruby' }
    parameters { {'text' => 'ruby'} }

    created_at { Time.now }
    updated_at { Time.now }
  end
end
