# frozen_string_literal: true

module Seam
  module Clients
    class BaseClient
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def request_seam_object(*attrs)
        client.request_seam_object(*attrs)
      end
    end
  end
end
