# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Funds do
  let!(:client) { FactoryBot.build(:client) }

  describe '#funds', :vcr do
    before do
      @funds = client.funds(per_page: 25).body
    end

    it 'returns an array' do
      expect(@funds['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@funds['data'].count).to eq 25
    end

    it 'returns funds objects' do
      expect(@funds['data'].first).to be_a(Hash)
      expect(@funds['data'].first['id']).to_not be_nil
    end
  end

  describe '#fund', :vcr do
    before do
      @fund = client.fund(131_737).body
    end

    it 'returns a fund object' do
      expect(@fund).to be_a(Hash)
      expect(@fund['data']['id']).to eq('131737')
    end
  end
end
