# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/auto_load.rb"

module PlanningCenterOnline
  class Client
    include PlanningCenterOnline::Endpoints::Campuses
    include PlanningCenterOnline::Endpoints::Funds
    include PlanningCenterOnline::Endpoints::People

    attr_accessor :url, :default_params

    def initialize(access_token)
      @access_token = access_token
      @url = 'https://api.planningcenteronline.com'
      @default_params = { page_size: 100, page: 1 }
    end

    private

    def connection
      @connection ||=
        Faraday.new(url, request: { timeout: 300_000 }) do |conn|
          conn.authorization :Bearer, @access_token
          conn.adapter :excon
        end
    end

    def get(path, params = {})
      params = default_params.merge(params)
      path = "#{path}?#{stringify_params(params)}"
      # puts "path = #{path}"
      response = connection.get(path) do |req|
        req.options.timeout = 300 # 5 minutes
      end
      handle_response(response)
    end

    def handle_response(response)
      case response.status
      when 200..299
        format_response(response)
      when 400
        raise PlanningCenterOnline::Exceptions::BadRequest, response
      when 401
        raise PlanningCenterOnline::Exceptions::Unauthorized, response
      when 403
        raise PlanningCenterOnline::Exceptions::Forbidden, response
      when 404
        raise PlanningCenterOnline::Exceptions::NotFound, response
      when 405
        raise PlanningCenterOnline::Exceptions::MethodNotAllowed, response
      when 422
        raise PlanningCenterOnline::Exceptions::UnprocessableEntity, response
      when 429
        raise PlanningCenterOnline::Exceptions::TooManyRequests, response
      when 400..499
        raise PlanningCenterOnline::Exceptions::ClientError, response
      when 500
        raise PlanningCenterOnline::Exceptions::InternalServerError, response
      when 500..599
        raise PlanningCenterOnline::Exceptions::ServerError, response
      else
        raise "unknown status #{response.status}"
      end
    end

    def format_response(response)
      results = JSON.parse(response.body, symbolize_names: true)
      results[:headers] = response.headers
      results
    end

    def stringify_params(params = {})
      arr = []
      params.map do |k, v|
        case v
        when is_a?(Array)
          v = v.join('%2C')
        when is_a?(Date)
          v = v.strftime('%Y-%m-%d')
        end
        arr << "#{k}=#{v}"
      end
      arr.join('&').gsub(' ', '%20')
    end
  end
end
