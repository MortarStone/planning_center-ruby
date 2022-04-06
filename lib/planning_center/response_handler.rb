# frozen_string_literal: true

module PlanningCenter
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
        raise PlanningCenter::Exceptions::BadRequest, response
      when 401
        raise PlanningCenter::Exceptions::Unauthorized, response
      when 403
        raise PlanningCenter::Exceptions::Forbidden, response
      when 404
        raise PlanningCenter::Exceptions::NotFound, response
      when 405
        raise PlanningCenter::Exceptions::MethodNotAllowed, response
      when 422
        raise PlanningCenter::Exceptions::UnprocessableEntity, response
      when 429
        raise PlanningCenter::Exceptions::TooManyRequests, response
      when 400..499
        raise PlanningCenter::Exceptions::ClientError, response
      when 500
        raise PlanningCenter::Exceptions::InternalServerError, response
      when 500..599
        raise PlanningCenter::Exceptions::ServerError, response
      else
        raise "unknown status #{response.status}"
      end
    end

    def format_response
      results = response.body

      if !results.blank?
        results['headers'] = response.headers
      end

      results
    end
  end
end
