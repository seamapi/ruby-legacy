require "http"
require "pry"

module Seam
  class Workspace
    def initialize(workspace_id: nil, name: nil, connect_partner_name: nil, is_sandbox: nil)
      @workspace_id = workspace_id
      @name = name
      @connect_partner_name = connect_partner_name
      @is_sandbox = is_sandbox
    end

    def to_s
      "Workspace(workspace_id: #{@workspace_id})"
    end

    def inspect
      "Workspace(workspace_id: #{@workspace_id})"
    end
  end

  class Device
    def self.from_hash(hash)
      @device_id = hash["device_id"]
    end
  end

  class ConnectWebview
    def self.from_hash(hash)
      @connect_webview_id = hash["connect_webview_id"]
    end
  end

  class ActionAttempt
    def self.from_hash(hash)
      @action_attempt_id = hash["action_attempt_id"]
    end
  end

  class Webhook
    def self.from_hash(hash)
      @webhook_id = hash["webhook_id"]
    end
  end

  class ConnectedAccount
    def self.from_hash(hash)
      @connected_account_id = hash["connected_account_id"]
    end
  end

  class AccessCode
    def self.from_hash(hash)
      @access_code_id = hash["access_code_id"]
    end
  end

  def self.instance_name_to_constructor
    {
      "workspace" => Workspace,
      "device" => Device,
      "connect_webview" => ConnectWebview,
      "webhook" => Webhook,
      "connected_account" => ConnectedAccount,
      "access_code" => AccessCode
    }
  end

  def self.as_args(h)
    h.map { |k, v| [k.to_sym, v] }.to_h
  end

  def self.convert_hash_to_instance(json)
    ret = nil
    instance_name_to_constructor.each do |instance_name, cls|
      ret = cls.new(**as_args(json[instance_name])) unless json[instance_name].nil?
      ret = json["#{instance_name}s"].map { |item| cls.new(**as_args(item)) } unless json["#{instance_name}s"].nil?
      break if ret
    end
    ret
  end
end
