# frozen_string_literal: true

module Seamapi
  class Routes
    ROUTES = {
      "device" => {
        list: {
          path: "devices/list",
          inner_object: "devices"
        },
        create: {
          path: "devices/create",
          inner_object: "device"
        }
      },
      "access_code" => {
        list: {
          path: "access_codes/list",
          inner_object: "access_codes"
        }
      },
      "workspace" => {
        list: {
          path: "workspaces/list",
          inner_object: "workspaces"
        }
      }
    }.freeze
  end
end
