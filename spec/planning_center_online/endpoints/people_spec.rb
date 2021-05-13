# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenterOnline::Endpoints::People do
  let!(:client) { FactoryBot.build(:client) }

  describe '#people', :vcr do
    before do
      @people = client.people(per_page: 25)
    end

    it 'returns an array' do
      expect(@people[:data]).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@people[:data].count).to eq 25
    end

    it 'returns people objects' do
      expect(@people[:data].first).to be_a(Hash)
      expect(@people[:data].first[:id]).to_not be_nil
    end
  end

  describe '#people with includes', :vcr do
    before do
      @people = client.people(
        per_page: 25,
        include: %w[
          households
          marital_status
          emails
          phone_numbers
          inactive_reason
          addresses
          name_suffix
        ]
      )
    end

    it 'returns an array' do
      expect(@people[:data]).to be_an(Array)
    end

    it 'returns the correct number of objects' do
      expect(@people[:data].count).to eq 25
    end

    it 'returns included objects' do
      included = @people[:included].map { |i| i[:type] }.uniq
      expect(included).to include('Household')
      expect(included).to include('MaritalStatus')
      expect(included).to include('Email')
      expect(included).to include('PhoneNumber')
      expect(included).to include('InactiveReason')
      expect(included).to include('Address')
    end
  end

  describe '#person', :vcr do
    before do
      @person = client.person(2_669_139)
    end

    it 'returns a person object' do
      expect(@person).to be_a(Hash)
      expect(@person[:data][:id]).to eq('2669139')
    end
  end
end
