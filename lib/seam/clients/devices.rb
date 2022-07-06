# frozen_string_literal: true

module Seam
  module Clients
    class Devices < BaseClient
      def list(params = {})
        request_seam_object(
          :get, "devices/list", params: params
        )["devices"].map do |device|
          Seam::Device.new(device)
        end
      end

      def get(device_id)
        request_seam_object(
          :get, "devices/get", params: { device_id: device_id }
        )
      end
    end
  end
end
