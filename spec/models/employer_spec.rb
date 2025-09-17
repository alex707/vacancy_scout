require 'app_helper'

RSpec.describe Employer, type: :model do
  let!(:employer) { create(:employer) }
  let!(:vacancy1) { create(:vacancy, employer_id: employer.id) }
  let!(:vacancy2) { create(:vacancy, employer_id: employer.id) }

  it 'vacancies for employer exists by association' do
    expect(employer.vacancies.first.id).to eq vacancy1.id
    expect(employer.vacancies.last.id).to eq vacancy2.id
  end

  it 'employer destroys with vacancies' do
    expect{ employer.destroy }.to change { Vacancy.count }.by(-2)
  end
end
