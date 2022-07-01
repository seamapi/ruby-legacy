# frozen_string_literal: true

module Seamapi
  module Operations
    module List
      include BaseOperation

      def list(params = {})
        response = Seamapi::Request.get(config[:path], params)

        response[config[:inner_object]].map do |object|
          new(object)
        end
      end

      def config
        route[:list]
      end
    end
  end
end
