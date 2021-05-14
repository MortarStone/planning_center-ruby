# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::RecurringDonations do
  let!(:client) { FactoryBot.build(:client) }

  describe '#recurring_donations', :vcr do
    before do
      @recurring_donations = client.recurring_donations
    end

    it 'returns an array' do
      expect(@recurring_donations['data']).to be_an(Array)
    end

    it 'returns recurring_donations objects' do
      expect(@recurring_donations['data'].first).to be_a(Hash)
      expect(@recurring_donations['data'].first['id']).to_not be_nil
    end
  end

  describe '#recurring_donation', :vcr do
    before do
      @recurring_donation = client.recurring_donation(362_440)
    end

    it 'returns a recurring_donation object' do
      expect(@recurring_donation).to be_a(Hash)
      expect(@recurring_donation['data']['id']).to eq('362440')
    end
  end
end
