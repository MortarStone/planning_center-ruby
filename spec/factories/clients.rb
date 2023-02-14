# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: PlanningCenter::Client do
    access_token { ENV.fetch('ACCESS_TOKEN') }

    initialize_with { new(access_token: access_token) }
  end

  factory :invalid_client, class: PlanningCenter::Client do
    access_token { 'abc' }

    initialize_with { new(access_token: access_token) }
  end
end
