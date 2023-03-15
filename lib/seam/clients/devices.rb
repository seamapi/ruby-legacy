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

      def list_device_providers(params = {})
        request_seam_object(
          :get,
          "/devices/list_device_providers",
          Seam::DeviceProvider,
          "device_providers",
          params: params
        )
      end
    end
  end
end
