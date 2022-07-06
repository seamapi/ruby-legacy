# frozen_string_literal: true

module Seam
  class BaseResource
    attr_accessor :data

    def initialize(data, client = nil)
      @data = data
      @client = client

      @data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def update_from_response(data)
      @data = data
      @data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.load_from_response(data, client = nil)
      if data.is_a?(Array)
        data.map { |d| new(d, client) }
      else
        new(data, client)
      end
    end

    def inspect
      "<#{self.class.name}:#{"0x00%x" % (object_id << 1)}\n" +
      instance_variables
        .map { |k| "#{k}".sub("@", "") }
        .filter { |k| k != "data" and k != "client" and respond_to? k }
        .map { |k| "  #{k}=#{send(k).inspect}" }
        .join("\n") + ">"
    end
  end
end
