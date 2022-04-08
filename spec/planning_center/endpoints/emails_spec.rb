# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Emails do
  let!(:client) { FactoryBot.build(:client) }

  describe '#emails', :vcr do
    before do
      @emails = client.emails(per_page: 25)
    end

    it 'returns an array' do
      expect(@emails['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@emails['data'].count).to eq 25
    end

    it 'returns emails objects' do
      expect(@emails['data'].first).to be_a(Hash)
      expect(@emails['data'].first['id']).to_not be_nil
    end
  end

  describe '#email', :vcr do
    before do
      @email = client.email(2_515_990)
    end

    it 'returns a email object' do
      expect(@email).to be_a(Hash)
      expect(@email['data']['id']).to eq('2515990')
    end
  end
end
