# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Groups do
  let!(:client) { FactoryBot.build(:client) }

  describe '#groups', :vcr do
    before do
      @groups = client.groups(per_page: 5).body
    end

    it 'returns an array' do
      expect(@groups['data']).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@groups['data'].count).to eq 5
    end

    it 'returns groups objects' do
      expect(@groups['data'].first).to be_a(Hash)
      expect(@groups['data'].first['id']).to_not be_nil
    end
  end

  describe '#group', :vcr do
    before do
      @group = client.group(779_944).body
    end

    it 'returns a group object' do
      expect(@group).to be_a(Hash)
      expect(@group['data']['id']).to eq('779944')
    end
  end
end
