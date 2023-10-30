# frozen_string_literal: true

module Seam
  module Clients
    class Devices < BaseClient
      def list(body = {})
        request_seam_object(
          :post,
          "/devices/list",
          Seam::Device,
          "devices",
          body: body
        )
      end

      def get(device_id = nil, name: nil)
        request_seam_object(
          :post,
          "/devices/get",
          Seam::Device,
          "device",
          body: {device_id: device_id, name: name}.compact
        )
      end

      def update(device_id: nil, is_managed: nil, name: nil, properties: nil)
        request_seam(
          :post,
          "/devices/update",
          body: {
            device_id: device_id,
            is_managed: is_managed,
            name: name,
            properties: properties
          }.compact
        )
      end

      def list_device_providers(body = {})
        request_seam_object(
          :post,
          "/devices/list_device_providers",
          Seam::DeviceProvider,
          "device_providers",
          body: body
        )
      end
    end
  end
end
