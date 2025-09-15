require 'app_helper'

RSpec.describe Vacancies::Create do
  subject { described_class }

  describe '#call' do
    context 'when employer is exists' do
      let(:employer_hhru_id) { 2473411 }
      let!(:employer) { create(:employer, hhru_id: employer_hhru_id) }

      let(:params) {
        {
          "id": "124463410",
          "name": "Android разработчик",
          "area": {"name": "Москва"},
          "salary_range": {
            "from": 130000,
            "to": 150000,
            "currency": "RUR"
          },
          "experience": {"id": "between1And3"},
          "description": "\u003Cp\u003EЗанимаемся разработкой мобильных приложений",
          "key_skills": [
            {"name": "Git"},
            {"name": "Kotlin"}
          ],
          "professional_roles": [
            {
              "id": "96",
              "name": "Программист, разработчик"
            }
          ],
          "employer": {"id" => employer_hhru_id.to_s},
          "published_at": "2025-08-26T00:36:51+0300",
          "created_at": "2025-08-26T00:36:51+0300",
          "employment_form": {"id": "FULL"},
          "work_format": [
            {"id": "REMOTE"}
          ]
        }
      }

      it 'create only one vacancy' do
        expect { described_class.new(**params).call}.to change { Vacancy.count }.by(1)
      end

      it 'create employer' do
        record = described_class.new(**params).call

        expect(record.employer_id).to eq employer.id.to_i
        expect(record.hhru_id).to eq params[:id].to_i
        expect(record.name).to eq params[:name]
        expect(record.description).to eq params[:description]
        expect(record.area).to eq params[:area][:name]
        expect(record.experience).to eq params[:experience][:id]
        expect(record.employment_form).to eq params[:employment_form][:id]
        expect(record.salary_from).to eq params[:salary_range][:from]
        expect(record.salary_to).to eq params[:salary_range][:to]
        expect(record.salary_currency).to eq params[:salary_range][:currency]

        # expect(record.work_format).to eq params[:work_format].map{_1[:id]}
        # expect(record.professional_roles).to eq params[:work_format].map{_1[:name]}
        # expect(record.key_skills).to eq params[:key_skills].map{_1[:name]}
      end
    end
  end
end
