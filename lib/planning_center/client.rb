# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/auto_load.rb"

module PlanningCenter
  class Client
    include PlanningCenter::Endpoints::Addresses
    include PlanningCenter::Endpoints::Campuses
    include PlanningCenter::Endpoints::DesignationRefunds
    include PlanningCenter::Endpoints::Donations
    include PlanningCenter::Endpoints::Emails
    include PlanningCenter::Endpoints::Funds
    include PlanningCenter::Endpoints::Households
    include PlanningCenter::Endpoints::InactiveReasons
    include PlanningCenter::Endpoints::MaritalStatuses
    include PlanningCenter::Endpoints::NameSuffixes
    include PlanningCenter::Endpoints::People
    include PlanningCenter::Endpoints::PhoneNumbers
    include PlanningCenter::Endpoints::PledgeCampaigns
    include PlanningCenter::Endpoints::Pledges
    include PlanningCenter::Endpoints::RecurringDonationDesignations
    include PlanningCenter::Endpoints::RecurringDonations
    include PlanningCenter::Endpoints::Refunds

    attr_accessor :url

    def initialize(access_token:)
      @access_token = access_token
      @url = 'https://api.planningcenteronline.com'
    end

    private

    def connection
      @connection ||=
        Faraday.new(url, request: { timeout: 300_000 }) do |conn|
          conn.request :authorization, 'Bearer', @access_token
        end
    end

    def get(path, params = {})
      path = RequestFormatter.new(path: path, params: params).call
      # puts "path = #{path}"
      response = connection.get(path) do |req|
        req.options.timeout = 300 # 5 minutes
      end
      ResponseHandler.new(response: response).call
    end
  end
end