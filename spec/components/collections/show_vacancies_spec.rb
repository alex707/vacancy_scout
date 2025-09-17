require 'app_helper'

RSpec.describe Collections::ShowVacancies do
  subject { described_class }

  describe '#call' do
    let!(:employer) { create(:employer) }
    let!(:vacancy) { create(:vacancy, employer_id: employer.id) }
    let!(:collection) { create(:collection) }
    let!(:collection_vacancy) { create(:collection_vacancy, collection_id: collection.id, vacancy_id: vacancy.id) }

    it 'show vacancies and their employers' do
      records = described_class.new(collection.id).call

      expect(records.first[:vacancy_name]).to eq vacancy.name
      expect(records.first[:employer_name]).to eq employer.name
    end
  end
end
