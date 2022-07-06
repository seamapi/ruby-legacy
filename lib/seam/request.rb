# frozen_string_literal: true

require "http"

module Seam
  class Request
    attr_reader :base_uri, :api_key

    class Error < StandardError
      def initialize(message, status, response)
        super(message)
        @status = status
        @response = response
      end
    end

    def initialize(api_key, base_uri)
      @base_uri = base_uri
      @api_key = api_key
    end

    def perform(method, uri, config = {})
      Logger.info("Request: #{method} #{uri} #{config}")

      config[:body] = config[:body].to_json if config[:body]

      response = HTTP.request(
        method,
        build_url(uri),
        { headers: headers }.merge(config)
      )

      return response.parse if response.status.success?

      raise Error.new("Api Error #{response.status.code} #{method} #{uri}", response.status.code, response)
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
      "seam-ruby/#{Seam::VERSION}"
    end
  end
end
