# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlanningCenterOnline::Client do
  describe '#connect', :vcr do
    context 'with valid access_token' do
      it 'creates a connection' do
        client = FactoryBot.build(:client)
        expect(client).to be_a(PlanningCenterOnline::Client)
      end
    end

    context 'with invalid access_token' do
      it 'error on campuses', vcr: true do
        client = FactoryBot.build(:invalid_client)
        expect do
          client.campuses
        end.to raise_error(PlanningCenterOnline::Exceptions::Unauthorized)
      end
    end

    context 'when already connected' do
      before(:all) do
        @client = FactoryBot.build(:client)
      end

      it 'returns client' do
        client = @client
        expect(client).to be_a(PlanningCenterOnline::Client)
      end
    end
  end
end
