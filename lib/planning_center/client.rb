# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/auto_load.rb"

module PlanningCenter
  class Client
    include PlanningCenter::Endpoints::Addresses
    include PlanningCenter::Endpoints::Campuses
    include PlanningCenter::Endpoints::DesignationRefunds
    include PlanningCenter::Endpoints::Donations
    include PlanningCenter::Endpoints::Emails
    include PlanningCenter::Endpoints::FieldData
    include PlanningCenter::Endpoints::FieldDefinitions
    include PlanningCenter::Endpoints::FieldOptions
    include PlanningCenter::Endpoints::Funds
    include PlanningCenter::Endpoints::Groups
    include PlanningCenter::Endpoints::GroupTypes
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
    include PlanningCenter::Endpoints::Subscriptions
    include PlanningCenter::Endpoints::Tabs

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
      params = RequestFormatter.new(params: params).call
      request(method: :get, path: path, params: params)
    end

    def post(path, body = nil)
      request(method: :post, path: path, body: body)
    end

    def patch(path, body = nil)
      request(method: :patch, path: path, body: body)
    end

    def delete(path)
      request(method: :delete, path: path)
    end

    def request(path:, method: :get, params: {}, body: nil)
      response = connection.public_send(method) do |req|
        req.url path
        req.options.timeout = 60 # 1 minute
        req.params = params
        req.body = body
      end
      # puts "#{method.upcase} #{response.env.url} #{params}\n\n"

      ResponseHandler.new(response).call
    end
  end
end
