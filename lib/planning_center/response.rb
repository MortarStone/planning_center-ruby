# frozen_string_literal: true

module PlanningCenter
  class Response
    include ActiveModel::Attributes
    include ActiveModel::Model

    attr_accessor :code, :headers, :body, :success, :failure,
                  :status, :reason

    def self.from_http_response(http_response)
      obj = new(
        code: http_response.status,
        # need a hash object rather than Faraday::Utils::Header
        headers: http_response.headers.to_h,
        body: http_response.body,
        reason: http_response.reason_phrase,
        success: http_response.success?,
        failure: !http_response.success?,
        status: determine_status(http_response)
      )
      obj.handle_str_failure
      obj
    end

    def self.determine_status(http_response)
      http_response.success? ? :success : :failure
    end

    # Methods for interpreting error messages largely taken from:
    # https://github.com/planningcenter/pco_api_ruby/blob/master/lib/pco/api/errors.rb
    def handle_str_failure
      return unless body.is_a?(Hash)

      if body['message'].present?
        @reason = body['message']
      elsif body['errors'].present?
        @reason = validation_message
      end
    end

    def validation_message
      body['errors'].each_with_object([]) do |error, arr|
        arr << error_to_string(error)
      end.uniq.join('; ')
    end

    def error_to_string(error)
      return unless error.is_a?(Hash)

      [
        "#{error['title']}:",
        error.fetch('meta', {})['resource'],
        error.fetch('source', {})['parameter'],
        error['detail']
      ].compact.join(' ')
    end

    def error_message
      code.present? ? "#{code}: #{reason}" : reason
    end

    def empty?
      body['data'].empty?
    end
  end
end
