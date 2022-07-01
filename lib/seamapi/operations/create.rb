# frozen_string_literal: true

module Seamapi
  module Operations
    module Create
      include BaseOperation

      def create(params = {})
        response = Seamapi::Request.post(config[:path], params)

        new(response[config[:inner_object]])
      end

      def config
        route[:create]
      end
    end
  end
end
