# frozen_string_literal: true

module Helpers
  def stub_seam_request(method, path, body, status = 200, headers = {})
    stub_request(
      method,
      "https://connect.getseam.com/#{path}"
    ).to_return(status: status, body: body.to_json,
                headers: { "Content-Type" => "application/json" }.merge(headers))
  end
end
