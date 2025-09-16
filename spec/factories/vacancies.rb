FactoryBot.define do
  factory :vacancy do
    to_create { |instance| instance.save }

    employer { create(:employer) }
    sequence(:id)
    hhru_id { rand(1000) }
    name { 'вакансия' }
    description { 'вакансия-вакансия' }
    area { 'Moscow' }
    experience { 'разработка' }
    employment_form { 'разработка' }
    salary_from { 1 }
    salary_to { 2 }
    salary_currency { 'EUR' }
    work_format { ['REMOTE'] }
    professional_roles { ['dev'] }
    key_skills { ['Java'] }

    created_at { Time.now }
    updated_at { Time.now }
  end
end
