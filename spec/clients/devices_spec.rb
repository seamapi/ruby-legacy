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

  describe "#get with errors" do
    let(:device_id) { "device_id_1234" }
    let(:device_hash) { {device_id: device_id} }
    let(:device_removed_error) { {error_code: "device_removed", message: "Device was removed"} }
    let(:device_privacy_warning) { {warning_code: "privacy_mode", message: "Device is in privacy mode"} }

    before do
      stub_seam_request(:get, "/devices/get", {
        device: device_hash.merge(
          errors: [device_removed_error],
          warnings: [device_privacy_warning]
        )
      }).with(query: {device_id: device_id})
    end

    let(:result) { client.devices.get(device_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::Device)
    end

    it "returns device errors" do
      expect(result.errors.first.error_code).to eq("device_removed")
    end

    it "returns device warnings" do
      expect(result.warnings.first.warning_code).to eq("privacy_mode")
    end
  end
end
