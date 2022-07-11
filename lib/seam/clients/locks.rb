# frozen_string_literal: true

module Seam
  module Clients
    class Locks < BaseClient
      # Unlocks a door
      #
      # @param [String] device_id
      # @return [Seam::ActionAttempt]
      def unlock_door(device_or_id)
        request_seam_object(
          :post,
          "/locks/unlock_door",
          Seam::ActionAttempt,
          "action_attempt",
          body: {
            device_id: device_id(device_or_id)
          }
        )
      end

      # Locks a door
      #
      # @param [String] device_id
      # @return [Seam::ActionAttempt]
      def lock_door(device_or_id)
        request_seam_object(
          :post,
          "/locks/lock_door",
          Seam::ActionAttempt,
          "action_attempt",
          body: {
            device_id: device_id(device_or_id)
          }
        )
      end

      def list(params = {})
        request_seam_object(
          :get,
          "/locks/list",
          Seam::Device,
          "locks",
          params: params
        )
      end

      def get(device_or_id)
        request_seam_object(
          :get,
          "/locks/get",
          Seam::Device,
          "lock",
          params: {
            device_id: device_id(device_or_id)
          }
        )
      end

      protected

      def device_id(device_or_id)
        device_or_id.is_a?(Seam::Device) ? device_or_id.device_id : device_or_id
      end
    end
  end
end
