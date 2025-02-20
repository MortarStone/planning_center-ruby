# frozen_string_literal: true

module PlanningCenter
  class ResponseHandler
    attr_accessor :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def call
      handle_response
    end

    def response
      @response ||= Response.from_http_response(http_response)
    end

    private

    def handle_response
      case response.code
      when 200..299
        response
      when 400
        raise PlanningCenter::Exceptions::BadRequest.new(response), response.error_message
      when 401
        raise PlanningCenter::Exceptions::Unauthorized.new(response), response.error_message
      when 403
        raise PlanningCenter::Exceptions::Forbidden.new(response), response.error_message
      when 404
        raise PlanningCenter::Exceptions::NotFound.new(response), response.error_message
      when 405
        raise PlanningCenter::Exceptions::MethodNotAllowed.new(response), response.error_message
      when 422
        raise PlanningCenter::Exceptions::UnprocessableEntity.new(response), response.error_message
      when 429
        raise PlanningCenter::Exceptions::TooManyRequests.new(response), response.error_message
      when 400..499
        raise PlanningCenter::Exceptions::ClientError.new(response), response.error_message
      when 500
        raise PlanningCenter::Exceptions::InternalServerError.new(response), response.error_message
      when 500..599
        raise PlanningCenter::Exceptions::ServerError.new(response), response.error_message
      else
        raise PlanningCenter::Exceptions::PCStandardError.new(response), response.error_message
      end
    end
  end
end
