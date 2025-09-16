require 'app_helper'

RSpec.describe Employers::FindOrCreate do
  subject { described_class }

  describe '#call' do
    describe 'when employer is exists' do
      let(:employer_hhru_id) { 2473411 }
      let!(:employer) { create(:employer, hhru_id: employer_hhru_id) }

      let(:params) {
        {
          "id" => employer_hhru_id.to_s,
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

      it 'employer not created' do
        expect { described_class.new(**params).call }.to_not change { Employer.count }
      end
    end
  end
end
