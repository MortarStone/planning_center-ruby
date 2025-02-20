# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::DesignationRefunds do
  let!(:client) { FactoryBot.build(:client) }

  describe '#designation_refunds', :vcr do
    before do
      @designation_refunds = client.designation_refunds(53_134_447).body
    end

    it 'returns an array' do
      expect(@designation_refunds['data']).to be_an(Array)
    end

    it 'returns designation_refunds objects' do
      expect(@designation_refunds['data'].first).to be_a(Hash)
      expect(@designation_refunds['data'].first['id']).to_not be_nil
    end
  end
end
