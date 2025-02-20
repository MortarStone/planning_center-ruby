# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::Refunds do
  let!(:client) { FactoryBot.build(:client) }

  describe '#refund', :vcr do
    before do
      @refund = client.refund(53_134_447).body
    end

    it 'returns a refund object' do
      expect(@refund).to be_a(Hash)
      expect(@refund['data']['id']).to eq('27505')
    end
  end
end
