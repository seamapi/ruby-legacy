# frozen_string_literal: true

RSpec.describe Seam::Device do
  let(:client) { Seam::Client.new("some_api_key") }
  describe ".list" do
    let(:device_hash) { { device_id: "123" } }

    before do
      stub_seam_request(:get, "/devices/list", { devices: [device_hash] })
    end

    let(:devices) { client.devices.list }

    it "returns a list of Devices" do
      expect(devices).to be_a(Array)
      expect(devices.first).to be_a(Seam::Device)
      expect(devices.first.device_id).to be_a(String)
    end
  end
end
