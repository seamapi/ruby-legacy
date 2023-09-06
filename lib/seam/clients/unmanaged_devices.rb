# frozen_string_literal: true

module Seam
  module Clients
    class UnmanagedDevices < BaseClient
      def get(device_id = nil, name: nil)
        request_seam_object(
          :get,
          "/devices/unmanaged/get",
          Seam::UnmanagedDevice,
          "device",
          params: {
            device_id: device_id,
            name: name
          }.compact
        )
      end

      def list(params = {})
        request_seam_object(
          :get,
          "/devices/unmanaged/list",
          Seam::UnmanagedDevice,
          "devices",
          params: params
        )
      end

      def update(device_id: nil, is_managed: nil)
        request_seam(
          :patch,
          "/devices/unmanaged/update",
          body: {
            device_id: device_id,
            is_managed: is_managed
          }.compact
        )
      end
    end
  end
end
