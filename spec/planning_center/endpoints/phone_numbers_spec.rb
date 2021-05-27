# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenter::Endpoints::PhoneNumbers do
  let!(:client) { FactoryBot.build(:client) }

  describe '#phone_numbers', :vcr do
    before do
      @phone_numbers = client.phone_numbers(2_669_139)
    end

    it 'returns an array' do
      expect(@phone_numbers['data']).to be_an(Array)
    end

    it 'returns phone_numbers objects' do
      expect(@phone_numbers['data'].first).to be_a(Hash)
      expect(@phone_numbers['data'].first['id']).to_not be_nil
    end
  end

  describe '#phone_number', :vcr do
    before do
      @phone_number = client.phone_number(2_669_139, 60_503_519)
    end

    it 'returns a phone_number object' do
      expect(@phone_number).to be_a(Hash)
      expect(@phone_number['data']['id']).to eq('60503519')
    end
  end
end
