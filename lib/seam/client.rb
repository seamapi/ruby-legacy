# frozen_string_literal: true

module Seam
  class Client
    attr_accessor :api_key, :base_uri, :debug

    def initialize(api_key:, base_uri: "https://connect.getseam.com", debug: false)
      @api_key = api_key
      @base_uri = base_uri
      @debug = debug
    end

    def health
      request_seam(:get, "/health")
    end

    def locks
      @locks ||= Seam::Clients::Locks.new(self)
    end

    def devices
      @devices ||= Seam::Clients::Devices.new(self)
    end

    def action_attempts
      @action_attempts ||= Seam::Clients::ActionAttempts.new(self)
    end

    def access_codes
      @access_codes ||= Seam::Clients::AccessCodes.new(self)
    end

    def connect_webviews
      @connect_webviews ||= Seam::Clients::ConnectWebviews.new(self)
    end

    def connected_accounts
      @connected_accounts ||= Seam::Clients::ConnectedAccounts.new(self)
    end

    def workspaces
      @workspaces ||= Seam::Clients::Workspaces.new(self)
    end

    def request_seam_object(method, path, klass, inner_object, config = {})
      response = request_seam(method, path, config)

      data = response[inner_object]

      klass.load_from_response(data, self)
    end

    def request_seam(method, path, config = {})
      Seam::Request.new(
        api_key: api_key,
        base_uri: base_uri,
        debug: debug
      ).perform(
        method, path, config
      )
    end
  end
end
