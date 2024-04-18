# frozen_string_literal: true

module PlanningCenter
  class ResponseHandler
    attr_accessor :response

    def initialize(response)
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
        raise PlanningCenter::Exceptions::BadRequest, error_message
      when 401
        raise PlanningCenter::Exceptions::Unauthorized, error_message
      when 403
        raise PlanningCenter::Exceptions::Forbidden, error_message
      when 404
        raise PlanningCenter::Exceptions::NotFound, error_message
      when 405
        raise PlanningCenter::Exceptions::MethodNotAllowed, error_message
      when 422
        raise PlanningCenter::Exceptions::UnprocessableEntity, error_message
      when 429
        raise PlanningCenter::Exceptions::TooManyRequests, error_message
      when 400..499
        raise PlanningCenter::Exceptions::ClientError, error_message
      when 500
        raise PlanningCenter::Exceptions::InternalServerError, error_message
      when 500..599
        raise PlanningCenter::Exceptions::ServerError, error_message
      else
        raise PlanningCenter::Exceptions::PCStandardError, "unknown status #{response.status}"
      end
    end

    def format_response
      results = response.body
      results['headers'] = response.headers unless results.blank?
      results
    end

    # Methods for interpreting error messages largely taken from:
    # https://github.com/planningcenter/pco_api_ruby/blob/master/lib/pco/api/errors.rb
    def error_message
      return response.body.to_s unless response.body.is_a?(Hash)

      response.body['message'] || validation_message || response.body.to_s
    end

    def validation_message
      return if response.body['errors'].empty?

      response.body['errors'].each_with_object([]) do |error, arr|
        arr << error_to_string(error)
      end.uniq.join('; ')
    end

    def error_to_string(error)
      return unless error.is_a?(Hash)

      [
        "#{error['title']}:",
        error.fetch('meta', {})['resource'],
        error.fetch('source', {})['parameter'],
        error['response.body']
      ].compact.join(' ')
    end
  end
end
