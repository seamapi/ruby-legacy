# frozen_string_literal: true

module Seam
  module Clients
    class DeviceProviders < BaseClient
      def list(params = {})
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
