require "http"

module Seam
  class DeviceAPI
    def initialize(seam_client)
      @seam_client = seam_client
    end
  
    def list
      @seam_client.http_client.get("http://localhost:3000/devices/list")
    end
  
    def get
      @seam_client.http_client.get("http://localhost:3000/devices/get")
    end
  end

  class SeamClient
    def devices
      Seam::DeviceAPI.new(self)
    end
  end
end
