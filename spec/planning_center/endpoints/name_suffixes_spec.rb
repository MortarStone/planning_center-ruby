# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::NameSuffixes do
  let!(:client) { FactoryBot.build(:client) }

  describe '#name_suffixes', :vcr do
    before do
      @name_suffixes = client.name_suffixes(per_page: 25)
    end

    it 'returns an array' do
      expect(@name_suffixes['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@name_suffixes['data'].count).to eq 5
    end

    it 'returns name_suffixes objects' do
      expect(@name_suffixes['data'].first).to be_a(Hash)
      expect(@name_suffixes['data'].first['id']).to_not be_nil
    end
  end

  describe '#name_suffix', :vcr do
    before do
      @name_suffix = client.name_suffix(296_925)
    end

    it 'returns a name_suffix object' do
      expect(@name_suffix).to be_a(Hash)
      expect(@name_suffix['data']['id']).to eq('296925')
    end
  end
end
