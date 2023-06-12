# frozen_string_literal: true

module Seam
  module Clients
    class UnmanagedDevices < BaseClient
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
