# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Webhooks do
  let!(:client) { FactoryBot.build(:client) }

  describe '#subscriptions', :vcr do
    before do
      @subscriptions = client.subscriptions
    end

    it 'returns an array' do
      expect(@subscriptions['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@subscriptions['data'].count).to be > 1
    end

    it 'returns subscriptions objects' do
      expect(@subscriptions['data'].first).to be_a(Hash)
      expect(@subscriptions['data'].first['id']).to_not be_nil
    end
  end
end
