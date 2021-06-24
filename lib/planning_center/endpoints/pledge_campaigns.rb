# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module PledgeCampaigns
      def pledge_campaign(id, params = {})
        get(
          "giving/v2/pledge_campaigns/#{id}",
          params
        )
      end

      def pledge_campaigns(params = {})
        # We need to order the pledge_campaigns by a value (starts_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'giving/v2/pledge_campaigns',
          { order: :starts_at }.merge(params)
        )
      end
    end
  end
end
