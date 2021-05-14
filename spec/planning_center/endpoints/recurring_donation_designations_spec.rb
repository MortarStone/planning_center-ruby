# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::RecurringDonationDesignations do
  let!(:client) { FactoryBot.build(:client) }

  describe '#recurring_donation_designations', :vcr do
    before do
      @recurring_donation_designations = client.recurring_donation_designations(358_916)
    end

    it 'returns an array' do
      expect(@recurring_donation_designations[:data]).to be_an(Array)
    end

    it 'returns recurring_donation_designations objects' do
      expect(@recurring_donation_designations[:data].first).to be_a(Hash)
      expect(@recurring_donation_designations[:data].first[:id]).to_not be_nil
    end
  end

  describe '#recurring_donation_designation', :vcr do
    before do
      @recurring_donation_designation = client.recurring_donation_designation(358_916, 383_099)
    end

    it 'returns a recurring_donation_designation object' do
      expect(@recurring_donation_designation).to be_a(Hash)
      expect(@recurring_donation_designation[:data][:id]).to eq('383099')
    end
  end
end
