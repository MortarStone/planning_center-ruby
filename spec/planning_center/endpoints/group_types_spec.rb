# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::GroupTypes do
  let!(:client) { FactoryBot.build(:client) }

  describe '#group_types', :vcr do
    before do
      @group_types = client.group_types(per_page: 3).body
    end

    it 'returns an array' do
      expect(@group_types['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@group_types['data'].count).to eq 3
    end

    it 'returns group_types objects' do
      expect(@group_types['data'].first).to be_a(Hash)
      expect(@group_types['data'].first['id']).to_not be_nil
    end
  end

  describe '#group_type', :vcr do
    before do
      @group_type = client.group_type(120_399).body
    end

    it 'returns a group_type object' do
      expect(@group_type).to be_a(Hash)
      expect(@group_type['data']['id']).to eq('120399')
    end
  end
end
