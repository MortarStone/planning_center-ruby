# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenterOnline::Endpoints::Campuses do
  let!(:client) { FactoryBot.build(:client) }

  describe '#campuses', :vcr do
    before do
      @campuses = client.campuses
    end

    it 'returns an array' do
      expect(@campuses[:data]).to be_an(Array)
    end

    it 'returns campuses objects' do
      expect(@campuses[:data].first).to be_a(Hash)
      expect(@campuses[:data].first[:id]).to_not be_nil
    end
  end

  describe '#campus', :vcr do
    before do
      @campus = client.campus(44_710)
    end

    it 'returns a campus object' do
      expect(@campus).to be_a(Hash)
      expect(@campus[:data][:id]).to eq('44710')
    end
  end
end
