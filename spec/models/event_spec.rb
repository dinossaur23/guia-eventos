require 'rails_helper'

RSpec.describe Event do
  describe '#search_events' do
    before { described_class.new(name: 'Festa legal da firma', zip_code: '03192-010').save }

    context 'given a name' do
      it 'returns the Event' do
        param = 'legal'
        expect(described_class.search_events(param).count).to eq 1
      end

      it 'dont return any Event' do
        param = 'chata'
        expect(described_class.search_events(param).count).to eq 0
      end
    end

    context 'given a zip_code' do
      it 'returns the Event' do
        param = '03192-01'
        expect(described_class.search_events(param).count).to eq 1
      end

      it 'dont return any Event' do
        param = '022213-122'
        expect(described_class.search_events(param).count).to eq 0
      end
    end
  end
end
