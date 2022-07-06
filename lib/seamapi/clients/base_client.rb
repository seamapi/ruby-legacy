# frozen_string_literal: true

module Seamapi
  module Clients
    class BaseClient
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def request_seam_object(method, path, config = {})
        Seamapi::Request.new(
          client.api_key,
          client.base_uri
        ).perform(
          method, path, config
        )
      end
    end
  end
end
