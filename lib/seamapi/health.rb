require "http"

module Seam
  class SeamClient
    def health
      res = @http_client.get("http://localhost:3000/health")
      puts res.body
      res
    end
  end
end
