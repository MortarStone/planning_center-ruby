# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative 'endpoints/addresses'
require_relative 'endpoints/campuses'
require_relative 'endpoints/designation_refunds'
require_relative 'endpoints/donations'
require_relative 'endpoints/emails'
require_relative 'endpoints/funds'
require_relative 'endpoints/households'
require_relative 'endpoints/inactive_reasons'
require_relative 'endpoints/marital_statuses'
require_relative 'endpoints/name_suffixes'
require_relative 'endpoints/people'
require_relative 'endpoints/phone_numbers'
require_relative 'endpoints/pledge_campaigns'
require_relative 'endpoints/pledges'
require_relative 'endpoints/recurring_donation_designations'
require_relative 'endpoints/recurring_donations'
require_relative 'endpoints/refunds'
require_relative 'endpoints/webhooks'
require_relative 'request_formatter'
require_relative 'response_handler'
