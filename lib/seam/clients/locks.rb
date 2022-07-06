# frozen_string_literal: true

module Seam
  module Clients
    class Locks < BaseClient
      # Unlocks a door
      #
      # @param [String] device_id
      # @return [Seam::ActionAttempt]
      def unlock(device_id)
        request_seam_object(
          :post, "locks/lock_door", body: { device_id: device_id }
        )
      end

      # Something Here
      #
      # @param [String] device_id
      # @return [Seam::ActionAttempt]
      def lock(device_id)
        request_seam_object(
          :post, "locks/unlock_door", body: { device_id: device_id }
        )
      end
    end
  end
end
