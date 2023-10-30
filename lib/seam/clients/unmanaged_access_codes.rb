# frozen_string_literal: true

module Seam
  module Clients
    class UnmanagedAccessCodes < BaseClient
      def get(access_code_id = nil, device_id: nil, code: nil)
        request_seam_object(
          :post,
          "/access_codes/unmanaged/get",
          Seam::UnmanagedAccessCode,
          "access_code",
          body: {
            device_id: device_id,
            access_code_id: access_code_id,
            code: code
          }.compact
        )
      end

      def list(device_id)
        request_seam_object(
          :post,
          "/access_codes/unmanaged/list",
          Seam::UnmanagedAccessCode,
          "access_codes",
          body: {device_id: device_id}
        )
      end

      def convert_to_managed(access_code_id, allow_external_modification: nil)
        action_attempt = request_seam_object(
          :post,
          "/access_codes/unmanaged/convert_to_managed",
          Seam::ActionAttempt,
          "action_attempt",
          body: {
            access_code_id: access_code_id,
            allow_external_modification: allow_external_modification
          }.compact
        )
        action_attempt.wait_until_finished
        action_attempt
      end
    end
  end
end
