require "./lib/seamapi"

seamapi = Seam::Client.new(
  # api_key: "seam_q9hnxnoB_4dVCSHWJ3eThqA5EbeFW54s7",
  # base_uri: "https://connect.getseam.com"
  api_key: "seam_testtdGd_5MqzjbahVw6Ea9aGg63bvtjt"
)

response = seamapi.devices.update(device_id: "6d054519-103d-4e0e-8295-99ffa1bb4904", name: "This is a test")
puts(response)
