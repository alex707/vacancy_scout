require 'app_helper'

RSpec.describe Employers::Create do
  subject { described_class }

  describe '#call' do
    let(:params) {
      {
        "id" => "2473411",
        "name" => "Компания",
        "description" => "Компания",
        "site_url" => "http://company.ru",
        "area" => {"name" => "Москва"},
        "industries" => [
          {"name" => "Разработка программного обеспечения"}
        ],
        "open_vacancies" => 3,
      }
    }

    it 'create only one employer' do
      expect { described_class.new(**params).call}.to change { Employer.count }.by(1)
    end

    it 'create employer' do
      record = described_class.new(**params).call

      expect(record.hhru_id).to eq params['id'].to_i
      expect(record.name).to eq params['name']
      expect(record.description).to eq params['description']
      expect(record.site_url).to eq params['site_url']
      expect(record.area).to eq params['area']['name']
      expect(record.industry_type).to eq params['industries'].first['name']
    end
  end
end
