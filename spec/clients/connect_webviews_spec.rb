# frozen_string_literal: true

RSpec.describe Seam::Clients::ConnectWebviews do
  let(:client) { Seam::Client.new(api_key: "some_api_key") }

  describe "#list" do
    let(:connect_webview_hash) { { connect_webview_id: "123" } }
    # let(:device_id) { "device_id_1234" }

    before do
      stub_seam_request(:get, "/connect_webviews/list", { connect_webviews: [connect_webview_hash] })
    end

    let(:connect_webviews) { client.connect_webviews.list }

    it "returns a list of Devices" do
      expect(connect_webviews).to be_a(Array)
      expect(connect_webviews.first).to be_a(Seam::ConnectWebview)
      expect(connect_webviews.first.connect_webview_id).to be_a(String)
    end
  end

  describe "#get" do
    let(:connect_webview_id) { "connect_webview_id_1234" }
    let(:connect_webview_hash) { { connect_webview_id: connect_webview_id } }

    before do
      stub_seam_request(
        :get, "/connect_webviews/get", { connect_webview: connect_webview_hash }
      ).with(
        query: { connect_webview_id: connect_webview_id }
      )
    end

    let(:result) { client.connect_webviews.get(connect_webview_id) }

    it "returns a Device" do
      expect(result).to be_a(Seam::ConnectWebview)
    end
  end

  describe "#create" do
    let(:accepted_providers) { %w[facebook google] }
    let(:connect_webview_hash) { { connect_webview_id: "123" } }

    before do
      stub_seam_request(
        :post, "/connect_webviews/create", { connect_webview: connect_webview_hash }
      ).with do |req|
        req.body.source == { accepted_providers: accepted_providers }.to_json
      end
    end

    let(:result) { client.connect_webviews.create(accepted_providers: accepted_providers) }

    it "returns a ConnectWebview" do
      expect(result).to be_a(Seam::ConnectWebview)
    end
  end
end
