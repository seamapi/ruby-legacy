# frozen_string_literal: true

module Seam
  module Clients
    class BaseClient
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def request_seam_object(method, path, klass, inner_object, config = {})
        response = Seam::Request.new(
          client.api_key,
          client.base_uri
        ).perform(
          method, path, config
        )

        data = response[inner_object]

        klass.load_from_response(data)
      end
    end
  end
end
