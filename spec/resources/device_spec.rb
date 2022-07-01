# frozen_string_literal: true

RSpec.describe Seamapi::Device do
  describe "#list" do
    let(:device_hash) { { device_id: "123" } }

    before do
      stub_seam_request(:get, "devices/list", { devices: [device_hash] })
    end

    let(:devices) { Seamapi::Device.list }

    it "returns a hash" do
      expect(devices).to be_a(Array)
      expect(devices.first).to be_a(Seamapi::Device)
      expect(devices.first.device_id).to be_a(String)
    end
  end
end
