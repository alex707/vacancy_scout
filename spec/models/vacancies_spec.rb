require 'app_helper'

RSpec.describe Vacancies, type: :model do
  let!(:employer) { create(:employer) }
  let!(:vacancy) { create(:vacancy, employer_id: employer.id) }

  it 'employer for vacancy exists by association' do
    expect(vacancy.employer.id).to eq employer.id
  end
end
