require 'app_helper'

RSpec.describe Collections::Create do
  subject { described_class }

  describe '#call' do
    let(:params) {
      {
        "name": "ruby",
        "parameters": {
          "text" => "ruby"
        }
      }
    }

    it 'create only one employer' do
      expect { described_class.new(**params).call}.to change { Collection.count }.by(1)
    end

    it 'create employer' do
      record = described_class.new(**params).call

      expect(record.name).to eq params[:name]
      expect(record.parameters).to eq params[:parameters]
    end
  end
end
