# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Addresses do
  let!(:client) { FactoryBot.build(:client) }

  describe '#addresses', :vcr do
    before do
      @addresses = client.addresses(per_page: 25).body
    end

    it 'returns an array' do
      expect(@addresses['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@addresses['data'].count).to eq 25
    end

    it 'returns addresses objects' do
      expect(@addresses['data'].first).to be_a(Hash)
      expect(@addresses['data'].first['id']).to_not be_nil
    end
  end

  describe '#address', :vcr do
    before do
      @address = client.address(30_896_373).body
    end

    it 'returns a address object' do
      expect(@address).to be_a(Hash)
      expect(@address['data']['id']).to eq('30896373')
    end
  end
end
