# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenterOnline::Endpoints::Donations do
  let!(:client) { FactoryBot.build(:client) }

  describe '#donations', :vcr do
    before do
      @donations = client.donations(per_page: 25)
    end

    it 'returns an array' do
      expect(@donations[:data]).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@donations[:data].count).to eq 25
    end

    it 'returns donations objects' do
      expect(@donations[:data].first).to be_a(Hash)
      expect(@donations[:data].first[:id]).to_not be_nil
    end
  end

  describe '#donation', :vcr do
    before do
      @donation = client.donation(46_653_783)
    end

    it 'returns a donation object' do
      expect(@donation).to be_a(Hash)
      expect(@donation[:data][:id]).to eq('46653783')
    end
  end
end
