# frozen_string_literal: true

module Seamapi
  module Operations
    module BaseOperation
      def route
        Seamapi::Routes::ROUTES[route_key]
      end

      def class_name
        name.split("::").last
      end

      def route_key
        class_name.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                  .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                  .downcase
      end
    end
  end
end
