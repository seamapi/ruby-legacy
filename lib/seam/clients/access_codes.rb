# frozen_string_literal: true

module Seam
  module Clients
    class AccessCodes < BaseClient
      def get(access_code_id)
        request_seam_object(
          :get,
          "/access_codes/get",
          Seam::AccessCode,
          "access_code",
          params: {access_code_id: access_code_id}
        )
      end

      def list(device_or_id)
        device_id = device_or_id.is_a?(Seam::Device) ? device_or_id.device_id : device_or_id

        request_seam_object(
          :get,
          "/access_codes/list",
          Seam::AccessCode,
          "access_codes",
          params: {device_id: device_id}
        )
      end

      def create(device_id: nil, name: nil, code: nil, starts_at: nil, ends_at: nil, use_backup_access_code_pool: nil)
        action_attempt = request_seam_object(
          :post,
          "/access_codes/create",
          Seam::ActionAttempt,
          "action_attempt",
          body: {device_id: device_id, code: code, starts_at: starts_at, ends_at: ends_at, name: name,
                 use_backup_access_code_pool: use_backup_access_code_pool}.compact
        )
        action_attempt.wait_until_finished
        # TODO: check if failed
        Seam::AccessCode.new(action_attempt.result["access_code"], @client)
      end

      def delete(access_code_id)
        action_attempt = request_seam_object(
          :post,
          "/access_codes/delete",
          Seam::ActionAttempt,
          "action_attempt",
          body: {access_code_id: access_code_id}
        )
        action_attempt.wait_until_finished
        action_attempt
      end

      def update(access_code_id: nil, name: nil, code: nil, starts_at: nil, ends_at: nil)
        action_attempt = request_seam_object(
          :post,
          "/access_codes/update",
          Seam::ActionAttempt,
          "action_attempt",
          body: {
            access_code_id: access_code_id,
            name: name,
            code: code,
            starts_at: starts_at,
            ends_at: ends_at
          }.compact
        )
        action_attempt.wait_until_finished
        action_attempt
      end

      def pull_backup_access_code(access_code_id)
        request_seam_object(
          :post,
          "/access_codes/pull_backup_access_code",
          Seam::AccessCode,
          "backup_access_code",
          body: {access_code_id: access_code_id}
        )
      end
    end
  end
end
