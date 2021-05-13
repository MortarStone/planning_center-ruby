# frozen_string_literal: true

module PlanningCenterOnline
  class ResponseHandler
    attr_accessor :response

    def initialize(response:)
      @response = response
    end

    def call
      handle_response
    end

    private

    def handle_response
      case response.status
      when 200..299
        format_response
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

    def format_response
      results = JSON.parse(response.body, symbolize_names: true)
      results[:headers] = response.headers
      results
    end
  end
end
