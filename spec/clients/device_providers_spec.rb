# frozen_string_literal: true

RSpec.describe Seam::Clients::DeviceProviders do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }
  let(:device_provider_hash) {{
    device_provider_name: "august",
    display_name: "August",
    provider_categories: ["stable"]
  }}
  let(:stable_device_provider_hash) {{
    device_provider_name: "akuvox",
    display_name: "Akuvox",
    provider_categories: []
  }}

  describe "#list" do
    before do
      stub_seam_request(:get, "/devices/list_device_providers", 
      {device_providers: [device_provider_hash, stable_device_provider_hash]})
    end

    let(:devices) { client.device_providers.list }

    it "returns a list of stable Device Providers" do
      expect(devices).to be_a(Array)
      expect(devices.length).to eq(2)

      expect(devices.first).to be_a(Seam::DeviceProvider)
      expect(devices.first.device_provider_name).to be_a(String)
      expect(devices.first.display_name).to be_a(String)
      expect(devices.first.provider_categories).to be_a(Array)
    end
  end

  describe "#list (provider_category=stable)" do
    before do
      stub_seam_request(:get, "/devices/list_device_providers", 
      {device_providers: [stable_device_provider_hash]})
      .with(query: { provider_category: "stable" })
    end

    let(:devices) { client.device_providers.list({ provider_category: "stable" }) }

    it "returns a list of stable Device Providers" do
      expect(devices).to be_a(Array)
      expect(devices.length).to eq(1)

      expect(devices.first).to be_a(Seam::DeviceProvider)
      expect(devices.first.device_provider_name).to be_a(String)
      expect(devices.first.display_name).to be_a(String)
      expect(devices.first.provider_categories).to be_a(Array)
    end
  end
end
