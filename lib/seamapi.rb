# frozen_string_literal: true

raise "The seamapi gem has been moved to seam. Please refer to the migration guide at https://github.com/seamapi/ruby/releases/tag/v2.0.0"

require_relative "seam/version"
require_relative "seam/request"
require_relative "seam/logger"
require_relative "seam/client"
require_relative "seam/clients/base_client"
require_relative "seam/clients/devices"
require_relative "seam/clients/unmanaged_devices"
require_relative "seam/clients/locks"
require_relative "seam/clients/workspaces"
require_relative "seam/clients/connect_webviews"
require_relative "seam/clients/connected_accounts"
require_relative "seam/clients/access_codes"
require_relative "seam/clients/unmanaged_access_codes"
require_relative "seam/clients/action_attempts"
require_relative "seam/clients/events"
require_relative "seam/resources/base_resource"
require_relative "seam/resources/resource_warning"
require_relative "seam/resources/resource_error"
require_relative "seam/resources/resource_warnings_support"
require_relative "seam/resources/resource_errors_support"
require_relative "seam/resources/device"
require_relative "seam/resources/unmanaged_device"
require_relative "seam/resources/device_provider"
require_relative "seam/resources/access_code"
require_relative "seam/resources/unmanaged_access_code"
require_relative "seam/resources/action_attempt"
require_relative "seam/resources/connect_webview"
require_relative "seam/resources/connected_account"
require_relative "seam/resources/workspace"
require_relative "seam/resources/event"

module Seam
end
