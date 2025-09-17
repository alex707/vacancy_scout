require 'app_helper'

RSpec.describe Collection, type: :model do
  let!(:employer) { create(:employer) }
  let!(:vacancy) { create(:vacancy, employer_id: employer.id) }
  let!(:collection) { create(:collection) }
  let!(:collection_vacancy) { create(:collection_vacancy, collection_id: collection.id, vacancy_id: vacancy.id) }

  it 'vacancy for collection exists by association' do
    expect(collection.vacancies.first.id).to eq vacancy.id
  end
end
