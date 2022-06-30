require "http"

module Seam
  class WorkspacesAPI
    def initialize(seam_client)
      @seam_client = seam_client
      @http_client = @seam_client.http_client
    end
  
    def list
      @http_client.get("http://localhost:3000/workspaces/list")
    end
  
    def get
      JSON.parse(@http_client.get("http://localhost:3000/workspaces/get"))
    end
  end

  class SeamClient
    def workspaces
      Seam::WorkspacesAPI.new(self)
    end
  end
end
