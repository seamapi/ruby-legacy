require "http"

module Seam
  class SeamClient
    def health
      @http_client.get("http://localhost:3000/health")
    end
  end
end
