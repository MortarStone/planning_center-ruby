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
    include PlanningCenter::Endpoints::Webhooks

    attr_accessor :url

    def initialize(access_token:)
      @access_token = access_token
      @url = 'https://api.planningcenteronline.com'
    end

    def connection
      @connection ||=
        Faraday.new(url, request: { timeout: 300_000 }) do |conn|
          conn.request :authorization, 'Bearer', @access_token
          conn.request :json
          conn.response :json
        end
    end

    def get(path, params = {})
      path = RequestFormatter.new(path: path, params: params).call

      request(path: path)
    end

    def post(path, body = {})
      request(method: :post, path: path, body: body)
    end

    def patch(path, body = {})
      request(method: :patch, path: path, body: body)
    end

    def delete(path)
      request(method: :delete, path: path)
    end

    def request(path:, method: :get, body: {})
      res = connection.public_send(method) do |req|
        req.url "#{url}/#{path}"
        req.options.timeout = 300 # 5 minutes
        req.body = body.to_json
      end

      ResponseHandler.new(response: res).call
    end
  end
end
