# frozen_string_literal: true

module Seamapi
  module Operations
    module Find
      include BaseOperation

      def find(resource_id)
        url = config[:path].gsub(":id", resource_id)

        response = Seamapi::Request.get(url)

        new(response[config[:inner_object]])
      end

      def config
        route[:find]
      end
    end
  end
end
