# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::MaritalStatuses do
  let!(:client) { FactoryBot.build(:client) }

  describe '#marital_statuses', :vcr do
    before do
      @marital_statuses = client.marital_statuses(per_page: 25)
    end

    it 'returns an array' do
      expect(@marital_statuses['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@marital_statuses['data'].count).to eq 3
    end

    it 'returns marital_statuses objects' do
      expect(@marital_statuses['data'].first).to be_a(Hash)
      expect(@marital_statuses['data'].first['id']).to_not be_nil
    end
  end

  describe '#marital_status', :vcr do
    before do
      @marital_status = client.marital_status(296_943)
    end

    it 'returns a marital_status object' do
      expect(@marital_status).to be_a(Hash)
      expect(@marital_status['data']['id']).to eq('296943')
    end
  end
end
