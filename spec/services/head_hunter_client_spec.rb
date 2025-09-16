require 'app_helper'

RSpec.describe HeadHunterClient do
  subject { described_class.new }

  describe '#get_employer_data' do
    let(:employer_id) { 2473411 }
    let(:employer_link) { "https://api.hh.ru/employers/#{employer_id}" }
    let(:response) {
      OpenStruct.new(
        {
          status: 200,
          body: {
            "id" => "2473411",
            "name" => "Компания",
            "description" => "Компания",
            "site_url" => "http://company.ru",
            "open_vacancies" => 3
          }.to_json
        }
      )
    }

    before do
      allow(HTTPX).to receive(:get).with(employer_link).and_return(response)
    end

    it 'return employer data' do
      employer = subject.get_employer_data(employer_id)

      expect(employer['id']).to eq employer_id.to_s
      expect(employer['name']).to eq 'Компания'
    end
  end

  describe '#get_vacancy' do
    let(:vacancy_id) { 124463410 }
    let(:vacancies_link) { "https://api.hh.ru/vacancies/#{vacancy_id}" }
    let(:response) {
      OpenStruct.new(
        {
          status: 200,
          body: {
            "id" => "124463410",
            "name" => "Android разработчик",
            "area" => {"name" => "Москва"},
            "salary_range" => {
              "from" => 130000,
              "to" => 150000,
              "currency" => "RUR"
            },
            "experience" => {"id" => "between1And3"},
            "description" => "\u003Cp\u003EЗанимаемся разработкой мобильных приложений",
            "key_skills" => [
              {"name" => "Git"},
              {"name" => "Kotlin"}
            ],
            "professional_roles" => [
              {
                "id" => "96",
                "name" => "Программист, разработчик"
              }
            ],
            "employer" => {"id" => "2473411"},
            "published_at" => "2025-08-26T00:36:51+0300",
            "created_at" => "2025-08-26T00:36:51+0300",
            "employment_form" => {"id" => "FULL"},
            "work_format" => [
              {"id" => "REMOTE"}
            ]
          }.to_json
        }
      )
    }

    before do
      allow(HTTPX).to receive(:get).with(vacancies_link).and_return(response)
    end

    it 'return vacancies data' do
      vacancy = subject.get_vacancy_data(vacancy_id)

      expect(vacancy['id']).to eq vacancy_id.to_s
      expect(vacancy['name']).to eq 'Android разработчик'
    end
  end

  describe '#get_vacancies' do
    let(:employer_id) { 2473411 }
    let(:vacancy_id) { 124463410 }
    let(:vacancies_link) { "https://api.hh.ru/vacancies?employer_id=#{employer_id}" }
    let(:response) {
      OpenStruct.new(
        {
          status: 200,
          body: {
            "items": [
              {
                "id": "124463410",
                "name": "Android разработчик",
                "salary_range": {
                  "from": 130000,
                  "to": 150000,
                  "currency": "RUR"
                },
                "created_at": "2025-08-26T00:36:51+0300",
                "employer": {"id": "2473411"},
                "archived": false,
                "work_format": [
                  {"id": "REMOTE"}
                ],
                "professional_roles": [
                  {
                    "id": "96",
                    "name": "Программист, разработчик"
                  }
                ],
                "experience": {"id": "between1And3"},
                "employment_form": {"id": "FULL"}
              }
            ],
            "found": 3,
            "pages": 1,
            "page": 0,
            "per_page": 20
          }.to_json
        }
      )
    }

    before do
      allow(HTTPX).to receive(:get).and_return(response)
    end

    it 'return vacancies data' do
      vacancies = subject.get_vacancies_data({employer_id:})

      expect(vacancies['items'].first['id']).to eq vacancy_id.to_s
      expect(vacancies['items'].first['name']).to eq 'Android разработчик'
    end
  end
end
