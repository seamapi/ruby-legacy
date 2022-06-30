require "http"

module Seam
  class Workspace
    def inspect
      "Workspace(workspace_id: #{@workspace_id})"
    end

    def self.from_hash(hash)
      @workspace_id = hash["workspace_id"]
    end
  end

  class Device
  end

  class Lock
  end

  class ConnectWebview
  end

  class ActionAttempt
  end

  class Webhook
  end

  class ConnectedAccount
  end

  class AccessCode
  end

  def self.instance_name_to_constructor 
    Hash.new({
      "workspace" => Workspace
    })
  end

  def self.convert_hash_to_instance(json)
    puts "converting"
    for instance_name, cls in self.instance_name_to_constructor
      puts instance_name, json[instance_name].is_not_nil?
      return cls.from_hash(json) if json[instance_name].is_not_nil?
    end
  end
end
