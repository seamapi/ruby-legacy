# frozen_string_literal: true

module Seamapi
  class Config
    attr_accessor :base_uri, :api_key

    def initialize
      @base_uri = "https://connect.getseam.com"
      @api_key = nil
    end
  end
end
