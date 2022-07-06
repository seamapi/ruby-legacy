# frozen_string_literal: true

module Seamapi
  module Clients
    class Locks < BaseClient
      def unlock(device_id)
        request_seam_object(
          :post, "locks/lock_door", body: { device_id: device_id }
        )
      end

      def lock(device_id)
        request_seam_object(
          :post, "locks/unlock_door", body: { device_id: device_id }
        )
      end
    end
  end
end
