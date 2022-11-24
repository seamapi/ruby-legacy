# frozen_string_literal: true

module Seam
  module Clients
    class Devices < BaseClient
      def list(params = {})
        request_seam_object(
          :get,
          "/devices/list",
          Seam::Device,
          "devices",
          params: params
        )
      end

      def get(device_id)
        request_seam_object(
          :get,
          "/devices/get",
          Seam::Device,
          "device",
          params: {device_id: device_id}
        )
      end
    end
  end
end
