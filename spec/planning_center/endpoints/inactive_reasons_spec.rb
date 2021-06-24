# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::InactiveReasons do
  let!(:client) { FactoryBot.build(:client) }

  describe '#inactive_reasons', :vcr do
    before do
      @inactive_reasons = client.inactive_reasons(per_page: 25)
    end

    it 'returns an array' do
      expect(@inactive_reasons['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@inactive_reasons['data'].count).to eq 3
    end

    it 'returns inactive_reasons objects' do
      expect(@inactive_reasons['data'].first).to be_a(Hash)
      expect(@inactive_reasons['data'].first['id']).to_not be_nil
    end
  end

  describe '#inactive_reason', :vcr do
    before do
      @inactive_reason = client.inactive_reason(296_937)
    end

    it 'returns a inactive_reason object' do
      expect(@inactive_reason).to be_a(Hash)
      expect(@inactive_reason['data']['id']).to eq('296937')
    end
  end
end
