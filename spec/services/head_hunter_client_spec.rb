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
            "id": "2473411",
            "name": "Компания",
            "description": "Компания",
            "site_url": "http://company.ru",
            "open_vacancies": 3
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
end
