require 'app_helper'

RSpec.describe Collections::Harvest do
  subject { described_class }

  describe '#call' do
    describe 'when employer and vacancy are exists' do
      let!(:employer1) { create(:employer, hhru_id: 5167287) }
      let!(:vacancy1) { create(:vacancy, hhru_id: 124935659, employer_id: employer1.id) }
      let!(:employer2) { create(:employer, hhru_id: 5167288) }
      let!(:vacancy2) { create(:vacancy, hhru_id: 124935660, employer_id: employer2.id) }

      let!(:collection) { create(:collection, name: 'ruby', parameters: {'text' => 'ruby'})}

      let(:page0_response) {
        {
          "items" => [ {"id" => "124935659", "employer" => {"id" => "5167287"}} ],
          "pages" => 2, "per_page" => 1, "page" => 0
        }
      }

      let(:page1_response) {
        {
          "items" => [ {"id" => "124935660", "employer" => {"id" => "5167288"}} ],
          "pages" => 2, "per_page" => 1, "page" => 1
        }
      }

      before do
        allow_any_instance_of(HeadHunterClient).to receive(:get_vacancies_data).with({'text' => 'ruby', 'page' => 0}).and_return(page0_response)
        allow_any_instance_of(HeadHunterClient).to receive(:get_vacancies_data).with({'text' => 'ruby', 'page' => 1}).and_return(page1_response)
      end

      it 'not create any objects' do
        expect { described_class.new(collection.id).call}.to_not change { Vacancy.count }
        expect { described_class.new(collection.id).call}.to_not change { Employer.count }
      end
    end
  end
end
