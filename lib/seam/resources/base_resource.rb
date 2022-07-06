# frozen_string_literal: true

module Seam
  class BaseResource
    attr_accessor :data

    def initialize(data)
      @data = data

      @data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
