# frozen_string_literal: true

module PlanningCenter
  module Exceptions
    class PCStandardError < StandardError
      attr_reader :response

      def initialize(response)
        super
        @response = response
      end
    end

    class AuthRequiredError < PCStandardError; end

    # 400..499
    class ClientError < PCStandardError; end

    # 400
    class BadRequest < PCStandardError; end

    # 401
    class Unauthorized < PCStandardError; end

    # 403
    class Forbidden < PCStandardError; end

    # 404
    class NotFound < PCStandardError; end

    # 405
    class MethodNotAllowed < PCStandardError; end

    # 422
    class UnprocessableEntity < PCStandardError; end

    # 429
    class TooManyRequests < PCStandardError; end

    # 500..599
    class ServerError < PCStandardError; end

    # 500
    class InternalServerError < PCStandardError; end
  end
end
