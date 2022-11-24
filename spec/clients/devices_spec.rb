# frozen_string_literal: true

RSpec.describe Seam::Clients::Devices do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#list" do
    let(:device_hash) { {device_id: "123"} }

    before do
      stub_seam_request(:get, "/devices/list", {devices: [device_hash]})
    end

    let(:devices) { client.devices.list }

    it "returns a list of Devices" do
      expect(devices).to be_a(Array)
      expect(devices.first).to be_a(Seam::Device)
      expect(devices.first.device_id).to be_a(String)
    end
  end

  describe "#get" do
    let(:device_id) { "device_id_1234" }
    let(:device_hash) { {device_id: device_id} }

    before do
      stub_seam_request(:get, "/devices/get", {device: device_hash}).with(query: {device_id: device_id})
    end

    let(:result) { client.devices.get(device_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::Device)
    end
  end
end
