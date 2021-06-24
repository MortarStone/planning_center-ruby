# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Households do
  let!(:client) { FactoryBot.build(:client) }

  describe '#households', :vcr do
    before do
      @households = client.households(per_page: 25)
    end

    it 'returns an array' do
      expect(@households['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@households['data'].count).to eq 25
    end

    it 'returns households objects' do
      expect(@households['data'].first).to be_a(Hash)
      expect(@households['data'].first['id']).to_not be_nil
    end
  end

  describe '#household', :vcr do
    before do
      @household = client.household(2_168_776)
    end

    it 'returns a household object' do
      expect(@household).to be_a(Hash)
      expect(@household['data']['id']).to eq('2168776')
    end
  end
end
