require 'app_helper'

RSpec.describe Vacancies::FindOrCreate do
  subject { described_class }

  describe '#call' do
    describe 'when employer is exists' do
      describe 'when vacancy is exists' do
        let(:employer_hhru_id) { 2473411 }
        let!(:employer) { create(:employer, hhru_id: employer_hhru_id) }

        let(:vacancy_hhru_id) { 124463410 }
        let!(:vacancy) { create(:vacancy, employer_id: employer.id, hhru_id: vacancy_hhru_id) }

        let(:params) {
          {
            "id" => vacancy_hhru_id.to_s,
            "name" => "Android разработчик",
            "employer" => {"id" => employer_hhru_id.to_s}
          }
        }

        it 'vacancy not created' do
          expect { described_class.new(**params).call }.to_not change { Vacancy.count }
        end
      end
    end
  end
end
