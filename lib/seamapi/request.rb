# frozen_string_literal: true

require "http"

module Seamapi
  class Request
    attr_reader :base_uri, :api_key

    class Error < StandardError
      def initialize(message, status, response)
        super(message)
        @status = status
        @response = response
      end
    end

    def initialize
      @base_uri = Seamapi.config.base_uri
      @api_key = Seamapi.config.api_key
    end

    def call(method, uri, params = {})
      Logger.info("Request: #{method} #{uri} #{params}")

      response = HTTP.request(method, build_url(uri), headers: headers, params: params)

      return response.parse if response.status.success?

      raise Error.new("Api Error #{response.status.code} #{method} #{uri}", response.status.code, response)
    end

    def self.get(uri, params = {})
      new.call(:GET, uri, params)
    end

    def self.post(uri, params = {})
      new.call(:POST, uri, params)
    end

    protected

    def build_url(uri)
      "#{base_uri}/#{uri}"
    end

    def headers
      {
        "User-Agent" => user_agent,
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{api_key}"
      }
    end

    def user_agent
      "seamapi-ruby/#{Seamapi::VERSION}"
    end
  end
end
