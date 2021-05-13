# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: PlanningCenterOnline::Client do
    access_token { ENV['ACCESS_TOKEN'] }

    initialize_with { new(access_token) }
  end

  factory :invalid_client, class: PlanningCenterOnline::Client do
    access_token { 'abc' }

    initialize_with { new(access_token) }
  end
end
